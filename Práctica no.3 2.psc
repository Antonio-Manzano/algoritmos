Algoritmo Descuento_total_de_compra_octubre
	Escribir "¿Cuál es el mes en el que se hace la compra?"
	Escribir "1: Octubre"
	Escribir "2: Cualquier otro mes"
	Leer mes
	Escribir "¿Cuál es el total de importe?"
	leer importe
	Si (mes=1) Entonces
		Escribir "El total del cobro para el cliente es de " (importe)-(importe*.15)
	SiNo
		Si (mes=2)
			Escribir "El total del cobro para el cliente es de " importe
		SiNo
			
		Escribir "Error, no seleccionaste el mes correctamente"
	FinSi
FinSi

	
FinAlgoritmo
