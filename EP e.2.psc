Algoritmo empleados_y_total
	nempleados<-0
	ntrabajadores<-0
	Escribir "�De cu�ntos empleados desea calcular el sueldo semanal?"
	Leer empleados
	Escribir "�Cu�nto se le paga por hora a los empleados?"
	Leer  sueldo
	Repetir
		empleado<-empleado+1
		Escribir "�Cu�ntas horas trabaj� esta semana el empleado n�mero " empleado "?"
		Leer num1
		num2<-num1
		Escribir "El sueldo semanal de el empleado n�mero " empleado " fue de $" sueldo*num1
		num5<-sueldo*num1
		num6<-num5+num6
		num3<-num2+num3
		num1<-0
	Hasta Que (empleado=empleados)
	Escribir "La empresa pag� $" num6 " por los empleados"
	
FinAlgoritmo
