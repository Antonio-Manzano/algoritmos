Algoritmo tabla_multiplicar
	Escribir "�De qu� n�mero quieres saber la tabla de multiplicar?"
	Leer numero1
	Repetir
	Repetir
		multiplicar<-multiplicar+1
		Escribir numero1 " x " multiplicar " = " numero1*multiplicar
		
	Hasta Que multiplicar=10
	Escribir "�Quiere saber la tabla de multiplicar de otro n�mero?"
	Leer want
	Si (want="Si" o waint="si" o want="sI" o want="SI") Entonces
		Escribir "Introduzca otro n�mero"
		Leer numero1
		multiplicar<-0
	FinSi
Hasta Que (want="No" o waint="no" o want="nO" o want="NO")
	
	
	

	
FinAlgoritmo
