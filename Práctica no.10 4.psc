Algoritmo Mayora0
	Definir numero1 Como Real;
	Definir numerost, totale Como Entero;
	numero1<-0;
	totale<-0;
	numerost<-0;
	Escribir "A continuación escribe 10 números";
	Repetir
		numerost<-numerost+1;
		Escribir "Introduce tu número";
		Leer numero1;
		Si (numero1 > 0) Entonces
			totale<-totale+1;
		FinSi
	Hasta Que (numerost = 10)
	Escribir "En total ingresaste ", totale," números mayores a 0";
FinAlgoritmo
