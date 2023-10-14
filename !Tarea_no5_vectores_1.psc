Algoritmo N�meromayor_posici�n
	Definir n, nmayor, cantidad, posicion Como Real;
	n<-0;
	nmayor<-0;
	posicion<-0;
	Escribir "Ingrese 5 n�meros";
	//Se declara el vector "cantidad" con capacidad de 5 elementos
	Dimension cantidad[5];
	//Se inicia un bucle para ingresar los 5 n�meros al vector "cantidad"
	Para n<-1 Hasta 5 Hacer
		//Se pide ingresar los elementos
		Escribir "Ingrese el elemento ", n;
		Leer cantidad[n];
		//Se comprueba la condici�n de que el n�mero ingresado es mayor al n�mero mayor asignado es correcta
		Si cantidad[n]>nmayor Entonces
			//Se cumple la condici�n y se asigna como n�mero mayor al n�mero ingresado
			nmayor<-cantidad[n];
		FinSi
	FinPara
	//Se imprime el n�mero mayor
	Escribir "El n�mero mayor es ", nmayor;
	//Se inicia un bucle para identificar cu�ntas veces se encuentra el n�mero mayor dentro del vector
	Para n<-1 Hasta 5 Hacer
		//Se comprueba la condici�n de que el n�mero mayor se encuentra en el vector es correcta
		Si cantidad[n]=nmayor Entonces
			//Se cumple la condici�n y se a�ade 1 para identificar cuantas veces se encuentra el el vector
			f<-f+1
		FinSi
	FinPara
	//Se imprime cuentas veces se encontr� el n�mero mayor dentro del vector
	Escribir "Se ha encontrado ", f, " veces el n�mero ", nmayor, " dentro del vector";
	//Se inicia un bucle para identificar las posiciones del n�mero mayor dentro del vector
	Para n<-1 Hasta 5 Hacer
		//Se comprueba la condici�n de que el n�mero mayor se encuentra en el vector es correcta
		Si cantidad[n]=nmayor Entonces
			//Se cumple la condici�n y se asigna la posicion en la que se encontr� el n�mero mayor
			posicion<-n
			//Se imprimen las posiciones del n�mero mayor
			Escribir " ", nmayor, " se encuentra en la posici�n ", n;
		FinSi
	FinPara
	//Se comprueba la condici�n de que el n�mero mayor se encuentre dentro del rango (1000-5000) es correcta
	Si (nmayor>=1000 y nmayor<=5000) Entonces
		//Se cumple la condici�n y se imprime lo que pasar� a continuaci�n
		Escribir "Se cumpli� la condici�n, se imprimir�n los n�meros a la inversa...";
		//Se inicia un bucle para imprimir los n�meros ingresados a la inversa
		Para n<-5 Hasta 1 Hacer
			Escribir " El elemento ", n, " es ", cantidad[n];
		FinPara
	SiNo
		//No se cumple la condici�n y se imprime un mensaje indicandolo
		Escribir "La condici�n no se cumpli�";
	FinSi
FinAlgoritmo
