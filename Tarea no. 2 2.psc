Algoritmo Par_impar_ninguno
	Definir numero1 Como Entero
	Escribir "Escribe un número entero"
	Leer numero1
	Si (numero1=0) Entonces
		Escribir "El número " numero1 " no es par ni impar."
	Sino
		Si (numero1%2=0) Entonces
			Escribir "El número " numero1 " es par."
		SiNo
			Escribir "El número " numero1 " es impar."
		FinSi
	FinSi
FinAlgoritmo
