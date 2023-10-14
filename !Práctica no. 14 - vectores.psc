Algoritmo Práctica_14
	Definir n, m, mayor1, mayor2, cantidadant Como Real;
	n<-0;
	mayor1<-0;
	mayor2<-0;
	cantidadant<-0;
	//Se imprime la pregunta para leer cuantos números serán ingresados
	Escribir "¿Cuántos numeros ingresará?";
	Leer n;
	//Se declara un vector llamado "cantidad" con la capacidad ingresada anteriormente, asignada ahora como "n"
	Dimension cantidad[n];
	//Se inicia un bucle para ingresar números al vector y para asignar al número mayor
	Para m<-1 Hasta n Hacer
		Escribir "Ingrese el número" 
		Leer cantidad[m];
		//Se comprueba la condición de que el número ingresado es mayor al número mayor ingresado es correcta
		Si cantidad[m]>mayor1 Entonces
			//Se cumple la condición y se asigna al número ingresado como número mayor
			mayor1<-cantidad[m];
		FinSi
	FinPara
	//Se inicia un bucle para asignar el número mayor como 0 y buscar nuevamente el número mayor
	Para m<-1 Hasta n Hacer
		//Se comprueba la condición de que el número mayor es igual al elemento actual en el bucle
		Si cantidad[m]=mayor1 Entonces
			//Se cumple la condición y al elemento actual se le asigna a 0
			cantidad[m]<-0
		FinSi
		//Se comprueba la condición de que el elemento actual es mayor al  elemento anterior
		Si cantidad[m]>mayor2 Entonces
			//Se cumple la condición y se asigna al elemento actual como segundo número mayor
			mayor2<-cantidad[m];
		FinSi
	FinPara
	Escribir "El número mayor es ", mayor1;
	Escribir "El segundo número mayor es ", mayor2;
FinAlgoritmo
