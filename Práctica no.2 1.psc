Algoritmo Comparar_numeros
	//Comparar cual n�mero es mayor o si son iguales.
	Escribir "Dime tu primer n�mero"
	Leer numero1
	Escribir "Dime tu segundo n�mero"
	Leer numero2
	Si (numero1-numero2>0) Entonces
		Escribir "El n�mero mayor es ",numero1
	SiNo
		Si (numero1=0) Entonces
			Escribir "Los n�meros ",numero1 "y ",numero2 " son iguales"
		SiNo
			Escribir "El n�mero mayor es ", numero2
		FinSi
	FinSi
FinAlgoritmo
