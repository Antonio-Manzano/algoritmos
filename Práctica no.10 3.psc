Algoritmo Mayor_a_0
	Definir numero1, numerot como Real;
	Definir finn Como Caracter;
	numero1<-0;
	numerot<-0;
	finn<-"0";
	Repetir
		Escribir "Introduce un n�mero";
		Leer numero1;
		Si (numero1>=0) Entonces
			finn<-"no";
			numerot<-numerot+numero1;
		SiNo
			finn<-"si";
		FinSi
	Hasta Que (finn="si")
	Escribir "La suma de los n�meros positivos es igual a ",numerot;
	FinAlgoritmo
	