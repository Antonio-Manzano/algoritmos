// app.js
require('dotenv').config(); // Carga las variables de entorno desde .env

const express = require('express');
const session = require('express-session');
const bcrypt = require('bcryptjs');
const mongoose = require('mongoose');
const app = express();

// Configuración de la base de datos
mongoose.connect(process.env.MONGO_URI)
    .then(() => console.log("Conectado a la base de datos"))
    .catch((err) => console.error("Error en conexión de base de datos", err));

// Configuración de la sesión
app.use(session({
    secret: process.env.SESSION_SECRET, // Usa la clave de sesión desde .env
    resave: false,
    saveUninitialized: true
}));

// Configuración de EJS
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

// Modelos de Usuario y Página
const UserSchema = new mongoose.Schema({
    username: String,
    password: String,
    role: { type: String, enum: ['user', 'admin'], default: 'user' }
});
const User = mongoose.model('User', UserSchema);

const PageSchema = new mongoose.Schema({
    title: String,
    averageRating: { type: Number, default: 0 }, // Promedio de calificaciones
    reviews: [
        {
            user: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
            rating: { type: Number, min: 1, max: 5 },
            comment: String
        }
    ]
});
const Page = mongoose.model('Page', PageSchema);

// Middleware para proteger rutas
function checkAuth(req, res, next) {
    if (req.session.userId) {
        next();
    } else {
        res.redirect('/login');
    }
}

// Middleware para verificar si el usuario es administrador
function checkAdmin(req, res, next) {
    if (req.session.userId) {
        User.findById(req.session.userId, (err, user) => {
            if (err || !user) return res.redirect('/login');
            if (user.role === 'admin') {
                next();
            } else {
                res.status(403).send('Acceso denegado: solo los administradores pueden realizar esta acción');
            }
        });
    } else {
        res.redirect('/login');
    }
}

// Rutas de registro y login
app.get('/register', (req, res) => {
    res.render('register');
});

app.post('/register', async (req, res) => {
    const { username, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    const user = new User({ username, password: hashedPassword });
    await user.save();
    res.redirect('/login');
});

app.get('/login', (req, res) => {
    res.render('login');
});

app.post('/login', async (req, res) => {
    const { username, password } = req.body;
    const user = await User.findOne({ username });
    if (user && await bcrypt.compare(password, user.password)) {
        req.session.userId = user._id;
        req.session.role = user.role;
        res.redirect('/page/' + 'sample-page-id'); // Cambia por una página específica
    } else {
        res.redirect('/login');
    }
});

// Ruta para ver una página y sus comentarios
app.get('/page/:id', checkAuth, async (req, res) => {
    const page = await Page.findById(req.params.id).populate('reviews.user');
    const user = await User.findById(req.session.userId);
    res.render('page', { page, userRole: user ? user.role : 'user' });
});

// Ruta para agregar una calificación y comentario
app.post('/page/:id/review', checkAuth, async (req, res) => {
    const { rating, comment } = req.body;
    const page = await Page.findById(req.params.id);

    page.reviews.push({
        user: req.session.userId,
        rating: Number(rating),
        comment
    });

    const totalRatings = page.reviews.reduce((sum, review) => sum + review.rating, 0);
    page.averageRating = totalRatings / page.reviews.length;

    await page.save();
    res.redirect(`/page/${req.params.id}`);
});

// Ruta para eliminar un comentario (solo para administradores)
app.post('/page/:pageId/review/:reviewId/delete', checkAdmin, async (req, res) => {
    const { pageId, reviewId } = req.params;

    try {
        const page = await Page.findById(pageId);
        page.reviews = page.reviews.filter(review => review._id.toString() !== reviewId);

        const totalRatings = page.reviews.reduce((sum, review) => sum + review.rating, 0);
        page.averageRating = page.reviews.length ? totalRatings / page.reviews.length : 0;

        await page.save();
        res.redirect(`/page/${pageId}`);
    } catch (error) {
        console.error(error);
        res.status(500).send("Error al eliminar el comentario");
    }
});

// Ruta para cerrar sesión
app.get('/logout', (req, res) => {
    req.session.destroy(() => {
        res.redirect('/login');
    });
});

// Escucha en el puerto definido en .env
const PORT = process.env.PORT || 3000; // Usa el puerto definido en .env o 3000 como predeterminado
app.listen(PORT, () => console.log(`Servidor escuchando en http://localhost:${PORT}`));