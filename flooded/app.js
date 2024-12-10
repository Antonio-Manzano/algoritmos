require('dotenv').config();
const express = require('express');
const session = require('express-session');
const bcrypt = require('bcryptjs');
const mongoose = require('mongoose');
const app = express();

mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log("Conectado a la base de datos"))
    .catch((err) => console.error("Error en conexión de base de datos", err));
app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true
}));

app.set('view engine', 'ejs');
app.set('views', __dirname + '/vistas');
app.use(express.urlencoded({ extended: true }));
app.use(express.static('metodos'));

const usuario_esquema = new mongoose.Schema({
    nombre_de_usuario: String,
    correo_e: String,
    contrasena: String,
    proyectos: [
        {
            nombre: String,
            jefe: Boolean
        }
    ],
    notificaciones: [
        {
            mensaje: String,
            fecha: { type: Date, default: Date.now },
            proyecto: String,
        }
    ]
});

const Usuario = mongoose.model('Usuario', usuario_esquema);

const proyecto_esquema = new mongoose.Schema({
    nombre: String,
    chat: [
        {
            mensaje: String,
            usuario: String,
            jefe: Boolean
        }
    ],
    graficas: [
        {
            titulo: String,
            tipo: Boolean,  // 'true' para gráfico circular, 'false' para gráfico de columnas
            datos: [
                {
                    serie: String,
                    valor: Number
                }
            ]
        }
    ],
    barra: Number, 
    tareas: [
        {
            nombre: String,
            fechaInicio: Date,
            fechaFin: Date,
        }
    ]
});

const Proyectos = mongoose.model('Proyectos', proyecto_esquema);




app.use((req, res, next) => {
    res.locals.isLoggedIn = !!req.session.usuarioId;
    res.locals.nombre_de_usuario = req.session.nombre_de_usuario || null;
    next();
});




app.get('/sesion', (req, res) => {
    res.render('sesion', { error: null});
});



app.post('/registro', async (req, res) => {
    const { nombre_de_usuario, correo_e, contrasena } = req.body;

    if (!nombre_de_usuario || !correo_e || !contrasena) {
        return res.render('sesion', { error: 'Todos los campos son obligatorios.' });
    }

    try {
        const usuarioExistente = await Usuario.findOne({
            $or: [{ nombre_de_usuario }, { correo_e }]
        });

        if (usuarioExistente) {
            const mensajeError = usuarioExistente.nombre_de_usuario === nombre_de_usuario
                ? 'El nombre de usuario ya está en uso.'
                : 'El correo electrónico ya está registrado.';
            return res.render('sesion', { error: mensajeError });
        }

        const encriptacontrasena = await bcrypt.hash(contrasena, 10);
        const nuevoUsuario = new Usuario({
            nombre_de_usuario,
            correo_e,
            contrasena: encriptacontrasena,
        });

        await nuevoUsuario.save();

        req.session.usuarioId = nuevoUsuario._id;
        req.session.nombre_de_usuario = nuevoUsuario.nombre_de_usuario;

        
        res.redirect('/flooded');
    } catch (error) {
        console.error('Error en registro:', error);
        res.status(500).render('sesion', { error: 'Error al registrar usuario.' });
    }
});



app.post('/login', async (req, res) => {
    const { correo_e, contrasena } = req.body;

    try {
        const usuario = await Usuario.findOne({ correo_e });
        if (!usuario) {
            return res.render('sesion', { error: 'Credenciales incorrectas.' });
        }

        
        const esContraseñaValida = await bcrypt.compare(contrasena, usuario.contrasena);
        
        if (!esContraseñaValida) {
            return res.render('sesion', { error: 'Credenciales incorrectas.' });
        }

        req.session.usuarioId = usuario._id;
        req.session.nombre_de_usuario = usuario.nombre_de_usuario;
        req.session.rol = usuario.rol;

        res.redirect('/flooded'); 
    } catch (error) {
        console.error(error);
        res.status(500).send('Error al iniciar sesión.');
    }
});



app.get('/inicio', (req, res) => {
    res.render('inicio');
});


app.get('/logout', (req, res) => {
    req.session.destroy(() => {
        res.redirect('/sesion');
    });
});

app.get('/flooded', async (req, res) => {
    try {
        const usuario = await Usuario.findById(req.session.usuarioId);
        if (!usuario) {
            return res.redirect('/sesion');
        }

        res.render('flooded', {
            nombreUsuario: usuario.nombre_de_usuario,
            correo: usuario.correo_e,
            proyectos: usuario.proyectos,
            notificaciones: usuario.notificaciones, 
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Error al cargar la página de proyectos.');
    }
});

app.post('/add-project', async (req, res) => {
    const { nombre, usuarios } = req.body;

    if (!nombre) {
        return res.status(400).json({ error: "El nombre del proyecto es obligatorio." });
    }

    try {
        const usuario = await Usuario.findById(req.session.usuarioId);
        if (!usuario) {
            return res.status(404).json({ error: "Usuario no encontrado." });
        }

        const nuevoProyecto = new Proyectos({
            nombre: nombre,
            chat: [], 
            graficas: [], 
            barra: 100 
        });

        await nuevoProyecto.save();

        usuario.proyectos.push({ nombre, jefe: true });
        await usuario.save();

        if (usuarios) {
            const correos = usuarios.split(', ').map(correo => correo.trim()); //(Esto es para que se guarden los correos separados por comas Alejandro)

            // (Enviar notificaciones a los usuarios de los cuales se adquirió su correo)
            for (const correo of correos) {
                const usuarioNotificado = await Usuario.findOne({ correo_e: correo });
                if (usuarioNotificado && usuario.correo_e != correo) {
                    usuarioNotificado.notificaciones.push({
                        mensaje: `Deseas ser añadido al proyecto "${nombre}".`,
                        proyecto: nombre
                    });
                    await usuarioNotificado.save();
                }
            }
        }

        res.redirect('/flooded');
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: "Error al agregar el proyecto." });
    }
});


app.post('/notificaciones/aceptar', async (req, res) => {
    const { notificacionId, proyectoNombre } = req.body;

    try {
        const usuario = await Usuario.findById(req.session.usuarioId);

        const notificacionIndex = usuario.notificaciones.findIndex(
            (noti) => noti._id.toString() === String(notificacionId)
        );

        usuario.proyectos.push({ nombre: proyectoNombre, jefe: false });
        usuario.notificaciones.splice(notificacionIndex, 1);
        await usuario.save();
        res.redirect('/flooded');
    } catch (error) {
    }
});


app.post('/notificaciones/rechazar', async (req, res) => {
    const { notificacionId } = req.body;

    try {
        const usuario = await Usuario.findById(req.session.usuarioId);
        const notificacionIndex = usuario.notificaciones.findIndex(
            (noti) => noti._id.toString() === notificacionId
        );


        usuario.notificaciones.splice(notificacionIndex, 1);
        await usuario.save();
        res.redirect('/flooded');
    } catch (error) {
    }
});

app.get('/proyecto/:nombre', async (req, res) => {
    const { nombre } = req.params;

    try {
        const usuario = await Usuario.findById(req.session.usuarioId);
        if (!usuario) {
            return res.redirect('/sesion');
        }

        const proyecto = usuario.proyectos.find(p => p.nombre === nombre);
        if (!proyecto) {
            return res.redirect('/flooded');
        }

        const detallesProyecto = await Proyectos.findOne({ nombre: nombre });
        
        res.render('proyecto', {
            nombreUsuario: usuario.nombre_de_usuario,
            correo: usuario.correo_e,
            notificaciones: usuario.notificaciones,
            proyectos: usuario.proyectos,
            proyecto: detallesProyecto,
            tareas: detallesProyecto.tareas
        });

    } catch (error) {
        console.error(error);
        res.status(500).send('Error al cargar el proyecto');
    }
});

app.post('/agregar-tarea', async (req, res) => {
    const { taskName, startDate, endDate, proyectoNombre } = req.body;

    try {
        const proyecto = await Proyectos.findOne({ nombre: proyectoNombre });

        if (!(!taskName || !startDate || !endDate || !proyectoNombre || !proyecto)) {

            const fechaInicio = new Date(startDate);
            const fechaFin = new Date(endDate);
            const diferenciaDias = (fechaFin - fechaInicio) / (1000 * 60 * 60 * 24);

            // Que la diferencia sea mayor a 1 día, sino, que no se guarde
            if (!(diferenciaDias < 1)) {
                const nuevaTarea = {
                    nombre: taskName,
                    fechaInicio: startDate,
                    fechaFin: endDate,
                };

                proyecto.tareas.push(nuevaTarea);

                await proyecto.save();
                res.redirect(`/proyecto/${proyecto.nombre}`);
            }
        }
    } catch (error) {
        console.error('Error al agregar la tarea:', error);
        res.status(500).send('Error al agregar la tarea');
    }
});


app.post('/agregar-comentario', async (req, res) => {
    const { recibido, proyectoNombre } = req.body;
    console.log(req.body);
    try {
        const usuario = await Usuario.findById(req.session.usuarioId);
        const proyectoUsuario = usuario.proyectos.find(p => p.nombre === proyectoNombre);
        if (!(!recibido || !proyectoNombre|| !usuario || !proyectoUsuario)) {


            const esJefe = proyectoUsuario.jefe;

            const proyecto = await Proyectos.findOne({ nombre: proyectoNombre });

            const nuevoComentario = {
                mensaje: recibido,
                usuario: usuario.nombre_de_usuario,
                jefe: esJefe,
            };

            proyecto.chat.push(nuevoComentario);

            await proyecto.save();

            res.redirect(`/proyecto/${proyecto.nombre}`);
        }
    } catch (error) {
        console.error('Error al agregar el comentario:', error);
        res.status(500).send('Error al agregar el comentario.');
    }
});


app.delete('/eliminar-tarea/:id', async (req, res) => {
    const { id } = req.params; 
    try {
        
        const proyecto = await Proyectos.findOne({ 'tareas._id': id });

        if (proyecto) {
                    
            proyecto.tareas = proyecto.tareas.filter(tarea => tarea._id.toString() !== id);

            
            await proyecto.save();

            
            res.json({ success: true, message: 'Tarea eliminada correctamente' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error al eliminar la tarea' });
    }
});

app.post('/add-graph', async (req, res) => {
    const { titulo, tipo, series, valores, proyectoNombre } = req.body;

    try {
        if (!(!titulo || !tipo || !series || !valores || series.length !== valores.length)) {
            
            const datos = series.map((serie, index) => ({
                serie,
                valor: valores[index]
            }));

            const proyecto = await Proyectos.findOne({ nombre: proyectoNombre});

            if (!proyecto) {
                return res.status(404).json({ error: "Proyecto no encontrado." });
            }

            // Buscar existencias de una gráfica con el mismo título en la base de datos
            const graficaExistente = proyecto.graficas.find(grafica => grafica.titulo === titulo);

            if (graficaExistente) {
                graficaExistente.tipo = tipo === "circular";
                graficaExistente.datos = datos;
            } else {
                const nuevaGrafica = {
                    titulo,
                    tipo: tipo === "circular",
                    datos
                };
                proyecto.graficas.push(nuevaGrafica);
            }

            await proyecto.save();

            res.redirect(`/proyecto/${proyecto.nombre}`);
        } 
    } catch (error) {
        console.error("Error al agregar o actualizar gráfica:", error);
        res.status(500).json({ error: "Error al agregar o actualizar la gráfica." });
    }
});



const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Servidor escuchando en http://localhost:${PORT}`));
