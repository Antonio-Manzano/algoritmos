Algoritmo Númeromayor_posición
	Definir n, nmayor, cantidad, posicion Como Real;
	n<-0;
	nmayor<-0;
	posicion<-0;
	Escribir "Ingrese 5 números";
	//Se declara el vector "cantidad" con capacidad de 5 elementos
	Dimension cantidad[5];
	//Se inicia un bucle para ingresar los 5 números al vector "cantidad"
	Para n<-1 Hasta 5 Hacer
		//Se pide ingresar los elementos
		Escribir "Ingrese el elemento ", n;
		Leer cantidad[n];
		//Se comprueba la condición de que el número ingresado es mayor al número mayor asignado es correcta
		Si cantidad[n]>nmayor Entonces
			//Se cumple la condición y se asigna como número mayor al número ingresado
			nmayor<-cantidad[n];
		FinSi
	FinPara
	//Se imprime el número mayor
	Escribir "El número mayor es ", nmayor;
	//Se inicia un bucle para identificar cuántas veces se encuentra el número mayor dentro del vector
	Para n<-1 Hasta 5 Hacer
		//Se comprueba la condición de que el número mayor se encuentra en el vector es correcta
		Si cantidad[n]=nmayor Entonces
			//Se cumple la condición y se añade 1 para identificar cuantas veces se encuentra el el vector
			f<-f+1
		FinSi
	FinPara
	//Se imprime cuentas veces se encontró el número mayor dentro del vector
	Escribir "Se ha encontrado ", f, " veces el número ", nmayor, " dentro del vector";
	//Se inicia un bucle para identificar las posiciones del número mayor dentro del vector
	Para n<-1 Hasta 5 Hacer
		//Se comprueba la condición de que el número mayor se encuentra en el vector es correcta
		Si cantidad[n]=nmayor Entonces
			//Se cumple la condición y se asigna la posicion en la que se encontró el número mayor
			posicion<-n
			//Se imprimen las posiciones del número mayor
			Escribir " ", nmayor, " se encuentra en la posición ", n;
		FinSi
	FinPara
	//Se comprueba la condición de que el número mayor se encuentre dentro del rango (1000-5000) es correcta
	Si (nmayor>=1000 y nmayor<=5000) Entonces
		//Se cumple la condición y se imprime lo que pasará a continuación
		Escribir "Se cumplió la condición, se imprimirán los números a la inversa...";
		//Se inicia un bucle para imprimir los números ingresados a la inversa
		Para n<-5 Hasta 1 Hacer
			Escribir " El elemento ", n, " es ", cantidad[n];
		FinPara
	SiNo
		//No se cumple la condición y se imprime un mensaje indicandolo
		Escribir "La condición no se cumplió";
	FinSi
FinAlgoritmo
