Algoritmo Nombre_edad
	Definir edad, edadmayor, medad Como Entero
	Definir nombre Como Caracter
	Escribir "�Cu�ntos alumnos quieres ingresar?"
	Leer n;
	Escribir "Recuerda que para dejar de a�adir elementos escribir * en el nombre"
	//Se declaran los vectores "nombre" y "edad" con capacidad de n elementos
	Dimension nombre[n];
	Dimension edad[n];
	//Se inicia un bucle para registrar dentro de los vectores los nombres y edades de los alumnos
	Para c<-1 Hasta n Hacer
		Escribir "Ingresa el nombre de alumno ", c;
		Leer nombre[c];
		//Se comprueba si se ha escrito "*" en el nombre para dejar de registrar alumnos
		Si nombre[c]<>"*" Entonces
			Escribir "Ingresa la edad del alumno ", c;
			Leer edad[c];
		FinSi
		Si nombre[c]="*" Entonces
			c<-n;
		FinSi
		//Se comprueba cual es el n�mero mayor de edad de todos los alumnos
		Si edad[c]>=edadmayor Entonces
			edadmayor<-edad[c]
		FinSi
	FinPara
	//Se comprueba si la edad mayor es de m�s de 18 a�os
	Si edadmayor>18 Entonces
		Escribir "Mostrando alumnos mayores de edad:";
	FinSi
	//Se inicia un bucle para imprimir los alumnos con menos a�os y se asigna una variable
	Para c<-1 Hasta n Hacer
		Si edad[c]>=18 Entonces
			Escribir " El alumno ", nombre[c], " con ", edad[c] " a�os";
			medad<-medad+1
		FinSi
	FinPara
	//Se comprueba si la edad mayor es de m�s de 18 a�os
	Si edadmayor<>0 Entonces
		Escribir "Mostrando alumnos con m�s edad: ";
	FinSi
	//Se comprueba cuales edades son iguales a la edad mayor para registrar a los alumnos
	Para c<-1 Hasta n Hacer
		Si edadmayor<>0 Entonces
			Si edad[c]=edadmayor Entonces
			Escribir " El alumno ", nombre[c], " con ", edad[c] " a�os";
		FinSi
	FinSi
	FinPara
	Si medad<>0 Entonces
		Escribir "Actualmente hay ", medad, " alumnos mayores de edad";
	FinSi
FinAlgoritmo
