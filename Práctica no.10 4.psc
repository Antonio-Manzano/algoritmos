Algoritmo Mayora0
	Definir numero1 Como Real;
	Definir numerost, totale Como Entero;
	numero1<-0;
	totale<-0;
	numerost<-0;
	Escribir "A continuaci�n escribe 10 n�meros";
	Repetir
		numerost<-numerost+1;
		Escribir "Introduce tu n�mero";
		Leer numero1;
		Si (numero1 > 0) Entonces
			totale<-totale+1;
		FinSi
	Hasta Que (numerost = 10)
	Escribir "En total ingresaste ", totale," n�meros mayores a 0";
FinAlgoritmo
