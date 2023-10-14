Algoritmo Encontrar_posición
	Definir n, X, posicion Como Entero
	Definir e, num Como Real;
	//Se declara el vector "X" con capacidad de 20 elementos
	Dimension X[20];
	Escribir "Ingresando 20 números para el vector X";
	//Se inicia un bucle para asignar un número a cada elemento del vector "X"
	Para n<-1 hasta 20 Hacer
		//Se pide ingresar los elementos para asignarlos al vector "X"
		Escribir "Ingrese el elemento ", n;
		Leer e;
		//Se asignan los elementos al vector "X"
		X[n]<-e;
	FinPara
	//Se pide ingresar un número para buscarlo dentro del vector "X"
	Escribir "Ingresa el número que quieres buscar";
	Leer num;
	//Se inicia un bucle para mostrar en su totalidad los elementos del vector "X"
	Para n<-1 hasta 20 Hacer
		Escribir "El elemento ", n, " es ", X[n];
	FinPara
	//Se inicia un bucle para comprobar cuántas veces se encontró el número ingresado dentro del vector "X"
	Para n<-1 Hasta 20 Hacer
		//Se comprueba la condición de que el número ingresado se encuentra en el vector "X" es correcta
		Si X[n]=num Entonces
			//Se cumple la condición y se añade 1 para identificar cuantas veces se encuentra el el vector
			f<-f+1
		FinSi
	FinPara
	//Se comprueba la condición de que se el número ingresado no se encontró 0 veces
	Si f<>0 Entonces
		//Se cumple la condición y se imprime cuentas veces se encontró el número mayor dentro del vector
		Escribir "Se ha encontrado ", f, " veces el número ", num, " dentro del vector";
		//Se inicia un bucle para buscar el número ingresado anteriormente en del vector "X"
		Para n<-1 Hasta 20 Hacer
			//Se comprueba la condición de que se encontró el número ingresado en el vector "X" es correcta
			Si X[n]=num Entonces
				//Se cumple la condición y se asigna la posicion en la que se encontró el número ingresado
				posicion<-n
				//Se imprimen las posiciones del número ingresado
				Escribir " ", num, " se encuentra en la posición ", posicion;
			FinSi
		FinPara
	SiNo
		//No se comprueba la condición y se imprime un "NO"
		Escribir "NO";
	FinSi
FinAlgoritmo
