Algoritmo N�meros_sumar
	Escribir "A continuaci�n escribe los n�meros a sumar"
	Escribir "Recuerda: al introducir 0 dejar� de pedir n�meros y se sumar�n los anteriores"
	Repetir
		leer num1
		num2<-num1+num2
		num3<-num3+1
		Si (num1=0) Entonces
			num4<-num2/(num3-1)
		SiNo
			num4<-num2/num3
		FinSi
	Hasta Que (num1=0)
	Escribir "La suma de estos n�meros es " num2
	Escribir "La media de estos n�meros es " num4
FinAlgoritmo
