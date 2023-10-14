Algoritmo Pr�ctica_14
	Definir n, m, mayor1, mayor2, cantidadant Como Real;
	n<-0;
	mayor1<-0;
	mayor2<-0;
	cantidadant<-0;
	//Se imprime la pregunta para leer cuantos n�meros ser�n ingresados
	Escribir "�Cu�ntos numeros ingresar�?";
	Leer n;
	//Se declara un vector llamado "cantidad" con la capacidad ingresada anteriormente, asignada ahora como "n"
	Dimension cantidad[n];
	//Se inicia un bucle para ingresar n�meros al vector y para asignar al n�mero mayor
	Para m<-1 Hasta n Hacer
		Escribir "Ingrese el n�mero" 
		Leer cantidad[m];
		//Se comprueba la condici�n de que el n�mero ingresado es mayor al n�mero mayor ingresado es correcta
		Si cantidad[m]>mayor1 Entonces
			//Se cumple la condici�n y se asigna al n�mero ingresado como n�mero mayor
			mayor1<-cantidad[m];
		FinSi
	FinPara
	//Se inicia un bucle para asignar el n�mero mayor como 0 y buscar nuevamente el n�mero mayor
	Para m<-1 Hasta n Hacer
		//Se comprueba la condici�n de que el n�mero mayor es igual al elemento actual en el bucle
		Si cantidad[m]=mayor1 Entonces
			//Se cumple la condici�n y al elemento actual se le asigna a 0
			cantidad[m]<-0
		FinSi
		//Se comprueba la condici�n de que el elemento actual es mayor al  elemento anterior
		Si cantidad[m]>mayor2 Entonces
			//Se cumple la condici�n y se asigna al elemento actual como segundo n�mero mayor
			mayor2<-cantidad[m];
		FinSi
	FinPara
	Escribir "El n�mero mayor es ", mayor1;
	Escribir "El segundo n�mero mayor es ", mayor2;
FinAlgoritmo
