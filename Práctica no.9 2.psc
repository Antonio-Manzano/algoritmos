Algoritmo sumar_n�meros
	cantidad<-1
	Escribir "�Cu�ntos n�meros quieres introducir?"
	Leer c
	Escribir "Introduce tus n�meros"
	Mientras (cantidad<=c)
		Leer n1
		Si (n1>0) Entonces
			mayor0<-mayor0+1
		SiNo
			Si (n1<0) Entonces
				menor0<-menor0+1
			SiNo
				igual0<-igual0+1
			FinSi
		FinSi
		cantidad<-cantidad+1
	FinMientras
	Escribir "�Cu�ntos n�meros son mayores a 0?"
	Escribir mayor0 " n�meros son mayores a 0"
	Escribir "�Cu�ntos n�meros son menores a 0?"
	Escribir menor0 " n�meros son menores a 0"
	Escribir "�Cu�ntos n�meros son iguales a 0?"
	Escribir igual0 " n�meros son iguales a 0"
FinAlgoritmo

