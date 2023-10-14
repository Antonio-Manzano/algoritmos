Algoritmo Encontrar_posici�n
	Definir n, X, posicion Como Entero
	Definir e, num Como Real;
	//Se declara el vector "X" con capacidad de 20 elementos
	Dimension X[20];
	Escribir "Ingresando 20 n�meros para el vector X";
	//Se inicia un bucle para asignar un n�mero a cada elemento del vector "X"
	Para n<-1 hasta 20 Hacer
		//Se pide ingresar los elementos para asignarlos al vector "X"
		Escribir "Ingrese el elemento ", n;
		Leer e;
		//Se asignan los elementos al vector "X"
		X[n]<-e;
	FinPara
	//Se pide ingresar un n�mero para buscarlo dentro del vector "X"
	Escribir "Ingresa el n�mero que quieres buscar";
	Leer num;
	//Se inicia un bucle para mostrar en su totalidad los elementos del vector "X"
	Para n<-1 hasta 20 Hacer
		Escribir "El elemento ", n, " es ", X[n];
	FinPara
	//Se inicia un bucle para comprobar cu�ntas veces se encontr� el n�mero ingresado dentro del vector "X"
	Para n<-1 Hasta 20 Hacer
		//Se comprueba la condici�n de que el n�mero ingresado se encuentra en el vector "X" es correcta
		Si X[n]=num Entonces
			//Se cumple la condici�n y se a�ade 1 para identificar cuantas veces se encuentra el el vector
			f<-f+1
		FinSi
	FinPara
	//Se comprueba la condici�n de que se el n�mero ingresado no se encontr� 0 veces
	Si f<>0 Entonces
		//Se cumple la condici�n y se imprime cuentas veces se encontr� el n�mero mayor dentro del vector
		Escribir "Se ha encontrado ", f, " veces el n�mero ", num, " dentro del vector";
		//Se inicia un bucle para buscar el n�mero ingresado anteriormente en del vector "X"
		Para n<-1 Hasta 20 Hacer
			//Se comprueba la condici�n de que se encontr� el n�mero ingresado en el vector "X" es correcta
			Si X[n]=num Entonces
				//Se cumple la condici�n y se asigna la posicion en la que se encontr� el n�mero ingresado
				posicion<-n
				//Se imprimen las posiciones del n�mero ingresado
				Escribir " ", num, " se encuentra en la posici�n ", posicion;
			FinSi
		FinPara
	SiNo
		//No se comprueba la condici�n y se imprime un "NO"
		Escribir "NO";
	FinSi
FinAlgoritmo
