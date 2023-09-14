Algoritmo Comparar_numeros
	//Comparar cual número es mayor o si son iguales.
	Escribir "Dime tu primer número"
	Leer numero1
	Escribir "Dime tu segundo número"
	Leer numero2
	Si (numero1-numero2>0) Entonces
		Escribir "El número mayor es ",numero1
	SiNo
		Si (numero1=0) Entonces
			Escribir "Los números ",numero1 "y ",numero2 " son iguales"
		SiNo
			Escribir "El número mayor es ", numero2
		FinSi
	FinSi
FinAlgoritmo
