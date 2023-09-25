Algoritmo Números_sumar
	Escribir "A continuación escribe los números a sumar"
	Escribir "Recuerda: al introducir 0 dejará de pedir números y se sumarán los anteriores"
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
	Escribir "La suma de estos números es " num2
	Escribir "La media de estos números es " num4
FinAlgoritmo
