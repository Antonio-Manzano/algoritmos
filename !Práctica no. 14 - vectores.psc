Algoritmo Pr�ctica_14
	Definir n, m, mayor1, mayor2, cantidadant Como Real;
	n<-0;
	mayor1<-0;
	mayor2<-0;
	cantidadant<-0;
	Escribir "�Cu�ntos numeros ingresar�?";
	Leer n;
	Dimension cantidad[n];
	Para m<-1 Hasta n Hacer
		Escribir "Ingrese el n�mero" 
		Leer cantidad[m];
		Si cantidad[m]>mayor1 Entonces
			mayor1<-cantidad[m];
		FinSi
	FinPara
	Para m<-1 Hasta n Hacer
		Si cantidad[m]=mayor1 Entonces
			cantidad[m]<-0
		FinSi
		Si cantidad[m]>mayor2 Entonces
			mayor2<-cantidad[m];
		FinSi
	FinPara
	Escribir "El n�mero mayor es ", mayor1;
	Escribir "El segundo n�mero mayor es ", mayor2;
FinAlgoritmo
