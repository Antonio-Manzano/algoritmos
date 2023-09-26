Algoritmo Inicio_De_Sesion
	Definir contrasena, errores Como Entero;
	contrasena<-0;
	errores<-0;
	Escribir "Bienvenido, por favor, introduce la contraseña";
	Repetir
		Escribir "Dame la contraseña";
		Leer contrasena;
		Si (contrasena = 352 o contrasena = 259 o contrasena = 569) Entonces
			Escribir "Bienvenido!";
		SiNo
			errores <- errores + 1;
		FinSi
	Hasta Que (contrasena = 352 o contrasena = 259 o contrasena = 569 ) o (errores = 3)
	Si (errores = 3) Entonces
		Escribir "Te quedaste sin intentos";
	FinSi
FinAlgoritmo
