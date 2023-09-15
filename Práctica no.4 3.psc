Algoritmo Horas_pagadas
	Escribir "Ingrese el nombre del trabajador"
	Leer nombre
	Escribir "Ingrese las horas trabajadas"
	Leer horas
	Escribir "Cual es la paga que " nombre " recibe por hora"
	Leer paga
	Si (horas>40) Entonces
		extra<-horas-40
		paga1<-(horas-extra)*paga
		tarifa<-(paga*1.5)*extra
		Escribir "El salario del trabajor es de $" paga1+tarifa
	SiNo
		paga1<-horas*paga
		Escribir "El salario del trabajador es de $" paga1
	FinSi
	
FinAlgoritmo
