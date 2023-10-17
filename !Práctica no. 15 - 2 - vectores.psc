Algoritmo Numeros_enteros
	Definir int, num, c, n, dif como Entero
	//Se declara el vector "num" con una capacidad de 10 elementos
	Dimension num[10];
	Escribir "Escribe 10 numeros enteros";
	//Se inicia un bucle para asignar cada numero ingresado a elementos del vector "num"
	Para c<-1 Hasta 10 Hacer
		//Se inicia un bucle para repetir pedir el numero
		Repetir
		Escribir "Escribe el numero ", c;
		Leer int;
		//Se inicia un bucle para comprobar si el numero ingresado no es igual a uno previamente ingresado
		Para n<-1 Hasta c Hacer
			//Se inicia una condicional para que se evite marcar el error en la primera vez que se ingrese un numero
			Si num[n]<>0 Entonces
				//Se compara el numero ingresado con todos los numeros que se hayan ingresado antes
				Si int=num[n] Entonces
					//Se comprueba la condicion y marca error, se asigna el numero 1 a la variable "dif" y se inicia el bucle para que te pida el numero de nuevo
					Escribir "Error, escribe un numero diferente a los que ya hayas ingresado";
					dif<-1;
					n<-c;
				SiNo
					//No se comprueba la condicion y se asigna el numero ingresado a un elemento del vector
					dif<-0;
					Si c=n Entonces
						num[n]<-int;
					FinSi
				FinSi
			SiNo
				//Se evita el error en la primera vez y se asigna el numero ingresado a un elemento del vector
				Si c=n Entonces
					num[n]<-int;
				FinSi
			FinSi
		FinPara
		Hasta Que dif=0;
	FinPara
	//Se imprimen por orden los numeros enteros ingresados
	Escribir "Imprimiendo los elementos ingresados...";
	Para n<-1 Hasta 10 Hacer
		Escribir "Entero numero ", n, ": ", num[n];
	FinPara
FinAlgoritmo
