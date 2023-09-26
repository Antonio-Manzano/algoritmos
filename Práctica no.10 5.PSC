Algoritmo Productosumaypromedio
	Definir multiplo4, paar, impaar, numero1, n1, n, mult Como Entero;  
	Definir prommult4 Como Real;
	n1<-0;
	multiplo4<-0;
	paar<-0;
	impaar<-0;
	numero1<-0;
	n<-0;
	prommult4<-0;
	mult<-0;
	Escribir "¿Cuántos números quieres ingresar?";
	Leer n;
	Repetir
		n1<-n1+1;
		Escribir "Introduzca un número";
		Leer numero1;
		Si (numero1%4=0) Entonces
			Si (multiplo4=0) Entonces
				multiplo4<-1;
			FinSi
			mult<-mult+1;
			multiplo4<-numero1*multiplo4;
			prommult4<-multiplo4/mult;
		FinSi
		Si (numero1%2=0 y numero1<25) Entonces
			Si (paar=0) Entonces
				paar<-1;
			FinSi
			paar<-numero1*paar;
		FinSi
		Si (numero1%2<>0 y numero1>16) Entonces
			impaar<-numero1+impaar;
		FinSi	
	Hasta Que (n = n1)
	Escribir "El producto de todos los números pares menores a 25 ingresados es ",paar;
	Escribir "La suma de todos los números impares mayores a 16 ingresados es ",impaar;
	Escribir "El promedio de todos los números multiplos de 4 ingresados es ",prommult4;
	FinAlgoritmo
	