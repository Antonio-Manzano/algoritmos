Algoritmo Paga_horas_empleado_6d�as
	Escribir "A continuaci�n escriba las horas que trabaj� el empleado cada uno de los 6 d�as que trabaja un empleado durante la semana"
	Repetir
		d�a<-d�a+1
		Escribir "�Cu�ntas horas trabaj� el d�a " d�a "?"
		Leer num1
		num2<-num1
		num3<-num2+num3
		num1<-0
	Hasta Que (d�a=6)
	Escribir "�Cu�nto le pagan por hora?"
	Leer pago
	paga<-pago*num3
	Escribir "El empleado trabaj� " num3 " horas."
	Escribir "El empleado recibir� $" paga " de pago."
	
FinAlgoritmo
