Algoritmo Operaciones_matem�ticas
	numero1<- 0
	numero2<- 0
	Escribir "1: Sumar"
	Escribir "2: Resta"
	Escribir "3: Multiplicar"
	Escribir "4: Dividir"
	Leer operacion
	Escribir "Primer n�mero"
	Leer numero1
	Escribir "Segundo n�mero"
	Leer numero2
	suma = numero1 + numero2
	resta = numero1 - numero2
	multiplicacion = numero1 * numero2
	division = numero1 / numero2
	Si operacion=1 Entonces
		Escribir "La suma de estos da " suma
	SiNo
		Si operacion=2 Entonces
			Escribir "La resta de estos da " resta
		SiNo
			Si operacion=3 Entonces
				Escribir "La multiplicaci�n de estos da " multiplicacion
			SiNo
				Si operacion=4
					Escribir "La divisi�n de estos da " division
				FinSi
			FinSi
		FinSi
	FinSi
FinAlgoritmo
