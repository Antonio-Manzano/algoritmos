Algoritmo sumar_números
	cantidad<-1
	Escribir "¿Cuántos números quieres introducir?"
	Leer c
	Escribir "Introduce tus números"
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
	Escribir "¿Cuántos números son mayores a 0?"
	Escribir mayor0 " números son mayores a 0"
	Escribir "¿Cuántos números son menores a 0?"
	Escribir menor0 " números son menores a 0"
	Escribir "¿Cuántos números son iguales a 0?"
	Escribir igual0 " números son iguales a 0"
FinAlgoritmo

