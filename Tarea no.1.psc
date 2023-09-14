Algoritmo Comparación_de_números
	numero1<- 0
	numero2<- 0
	Escribir "Primer número"
	leer numero1
	Escribir "Segundo número"
	leer numero2 
	Si numero1 >= numero2 Entonces
		Si numero1 >= 10 y numero1 <= 100 Entonces
			Si numero1%2=0 Entonces
				Escribir "El número " numero1 " se encuentra entre 10 y 100, y es par"
			SiNo
				Escribir "El número " numero1 " se encuentra entre 10 y 100, y es impar"
			FinSi
		SiNo
			Si	numero1%2=0 Entonces
				Escribir "El número " numero1 " no se encuentra entre 10 y 100, y es par"
			SiNo
				Escribir "El número " numero1 " no se encuentra entre 10 y 100, y es impar"
			FinSi
		FinSi
	SiNo
		Si numero2 >= 10 y numero2 <= 100 Entonces
			Si numero2%2=0 Entonces
				Escribir "El número " numero2 " se encuentra entre diez y cien, es par"
			SiNo
				Escribir "El número " numero2 " se encuentre entre diez y cien, es impar"
			FinSi
		SiNo
		 Si	numero2%2=0 Entonces
						Escribir "El número " numero2 " no se encuentra entre 10 y 100, y es par"
					SiNo
						Escribir "El número " numero2 " no se encuentra entre 10 y 100, y es impar"
					FinSi
				FinSi
			FinSi
FinProceso
