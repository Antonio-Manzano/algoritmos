Algoritmo Numeros_pares_impares
	Definir n, c, X, Z, xn, zn Como Entero
	Definir num como Real
	Escribir "¿Cuantos numeros ingresaras?";
	Leer n;
	Escribir "Recuerda que si ingresas un 0, se dejara de pedir numeros";
	//Se declaran los vectores "num", "X" y "Z" con capacidad de n elementos
	Dimension num[n];
	Dimension X[n];
	Dimension Z[n];
	//Se inicia un bucle para ingresar numeros, al ingresar el numero 0 termina
	Para c<-1 Hasta n Hacer
		Escribir "Ingresa un numero";
		Leer num[c];
		Si num[c]=0 Entonces
			c<-n;
		FinSi
	FinPara
	//Se inicia un bucle para conocer la cantidad de numeros pares y asignar esos mismos numeros pares al vector "X"
	Para c<-1 Hasta n Hacer
		Si num[c]%2=0 Entonces
			xn<-xn+1
			X[xn]<-num[c];
		FinSi
	FinPara
	//Se inicia un bucle para conocer la cantidad de numeros impares y asignar esos mismos numeros impares al vector "Z""
	Para c<-1 Hasta n Hacer
		Si num[c]%2<>0 Entonces
			zn<-zn+1
			Z[zn]<-num[c];
		FinSi
	FinPara
	//Condicional para mostrar los numeros pares
	Si xn>0 Entonces
		Escribir "Mostrando lista de vector [X] que corresponde a los numeros pares ";
		Para c<-1 Hasta n Hacer
			Si X[c]<>0 Entonces
				Escribir "	Numero ", X[c], " con posicion correspondiente a ", c, " dentro del vector [X]";
			FinSi
		FinPara
	FinSi
	//Condicional para mostrar los numeros impares
	Si zn>0 Entonces
		Escribir "Mostrando lista de vector [Z] que corresponde a los numeros impares ";
	FinSi
	Para c<-1 Hasta n Hacer
			Si Z[c]<>0 Entonces
				Escribir "	Numero ", Z[c], " con posicion correspondiente a ", c, " dentro del vector [Z]";
			FinSi
		FinPara
FinAlgoritmo
