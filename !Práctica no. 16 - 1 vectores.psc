Algoritmo Temperaturas
	Definir n, c Como Entero
	Definir temperatura, tempmedia, tempmayor, tempmenor, etemp Como Real
	

	Dimension temperatura[10]
	Dimension tempmedia[5]
	
	Para n<-1 Hasta 10 Hacer
		c<-c+1
		Escribir "Ingresando temperaturas del d�a ", c;
		Escribir "Escribe la temperatura m�nima del d�a ", c;
		Leer temperatura[n];
		n<-n+1
		Escribir "Escribe la temperatura m�xima del d�a ", c;
		Leer temperatura[n];
		tempmedia[c]<-(temperatura[n]+temperatura[n-1])/2;
		Si tempmedia[c]>tempmayor Entonces
			tempmayor<-tempmedia[c];
		FinSi
		Si tempmenor=0 Entonces
			tempmenor<-tempmayor;
		FinSi
		Si tempmedia[c]<tempmayor Entonces
			Si tempmedia[c]<tempmenor Entonces
				tempmenor<-tempmedia[c];
			FinSi
		FinSi
	FinPara
	c=0;
	Para n<-1 Hasta 5 Hacer
		c<-c+1
		Escribir "La temperatura media del d�a ", c, " es:";
		Escribir tempmedia[n], "�";
	FinPara
	Escribir "Los d�as con menos temperatura son:";
	Para n<-1 Hasta 5 Hacer
		Si tempmedia[n]=tempmenor Entonces
			Escribir "El d�a ", n, " con ", tempmedia[n], "�";
		FinSi
	FinPara
	Escribir "Escribe una temperatura m�xima";
	Leer etemp
	c=0;
	Para n<-2 Hasta 10 Hacer
		c<-c+1;
		Si temperatura[n]=etemp Entonces
			Escribir "El d�a ", c," coincide con esta temperatura m�xima, que es: ", temperatura[n], "�";
		FinSi
		n<-n+1;
	FinPara
	Si temperatura[2]<>etemp Entonces
		Si temperatura[4]<>etemp Entonces
			Si temperatura[6]<>etemp Entonces
				Si temperatura[8]<>etemp Entonces
					Si temperatura[10]<>etemp Entonces
						Escribir "No hay ning�n d�a que coincida con la temperatura m�xima insertada";
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
FinAlgoritmo
