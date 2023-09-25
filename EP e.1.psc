Algoritmo Paga_horas_empleado_6días
	Escribir "A continuación escriba las horas que trabajó el empleado cada uno de los 6 días que trabaja un empleado durante la semana"
	Repetir
		día<-día+1
		Escribir "¿Cuántas horas trabajó el día " día "?"
		Leer num1
		num2<-num1
		num3<-num2+num3
		num1<-0
	Hasta Que (día=6)
	Escribir "¿Cuánto le pagan por hora?"
	Leer pago
	paga<-pago*num3
	Escribir "El empleado trabajó " num3 " horas."
	Escribir "El empleado recibirá $" paga " de pago."
	
FinAlgoritmo
