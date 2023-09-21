Algoritmo calcula_promedio_n_personas
	Definir calif1, calif2, calif3, calif4, calif5 como Enteros
	//controlador del número de veces de recorrido al ciclo
	contador<-1;
	//solicitar el número de personas
	Escribir "¿Cuántos alumnos calcularás calificaciones";
	Leer N;
	//ciclo para calcular calificaciones
	Mientras contador<=N Hacer
		//calculo de calificaciones
		Escribir "Introduce la matricula"
		Leer matricula
		Escribir "Introduce el nombre del alumno"
		Leer nombre
		Escribir "Proporciona las 5 calificaciones"
		Leer calif1, calif2, calif3, calif4, calif5
		//calculamos el promedio
		promedio<-(calif1+calif2+calif3+calif4+calif5)/5
		Si (calif1<=0 o calif1>100) Entonces
			Escribir "Error, la calificación 1 no está en un rango de 0 a 100, escribela de nuevo"
			Leer calif1
			//calculamos el promedio
			promedio<-(calif1+calif2+calif3+calif4+calif5)/5
		FinSi
		Si (calif2<=0 o calif2>100) Entonces
			Escribir "Error, la calificación 2 no está en un rango de 0 a 100, escribela de nuevo"
			Leer calif2
			//calculamos el promedio
			promedio<-(calif1+calif2+calif3+calif4+calif5)/5
		FinSi
		Si (calif3<=0 o calif3>100) Entonces
			Escribir "Error, la calificación 3 no está en un rango de 0 a 100, escribela de nuevo"
			Leer calif3
			//calculamos el promedio
			promedio<-(calif1+calif2+calif3+calif4+calif5)/5
		FinSi
		Si (calif4<=0 o calif4>100) Entonces
			Escribir "Error, la calificación 4 no está en un rango de 0 a 100, escribela de nuevo"
			Leer calif4
			//calculamos el promedio
			promedio<-(calif1+calif2+calif3+calif4+calif5)/5
		FinSi
		Si (calif5<=0 o calif5>100) Entonces
			Escribir "Error, la calificación 5 no está en un rango de 0 y 100, escribela de nuevo"
			Leer calif5
			//calculamos el promedio
			promedio<-(calif1+calif2+calif3+calif4+calif5)/5
		FinSi
		//IMPRIMIR LA BOLETA DE CALIFICACIONES Y ESTATUS DEL ALUMNO
		Escribir "Matricula: ", matricula, " Nombre del alumno(a): ", nombre;
		Escribir "Las calificaciones son: "
		Escribir " ", calif1;
		Escribir " ", calif2;
		Escribir " ", calif3;
		Escribir " ", calif4;
		Escribir " ", calif5;
		//Indicamos si está aprobado o reprobado
		Si (calif1<70 o calif2<70 o calif3<70 o calif4<70 o calif5<70) Entonces
			promedio<-60
		FinSi
		Escribir " EL PROMEDIO FINAL ES ", promedio;
		Si (promedio >= 70) Entonces
			Escribir " ALUMNO(A) APROBADO(A)" 
		SiNo
			Escribir " ALUMNO(A) REPROBADO(A)"
		FinSi
		contador<-contador+1;
	FinMientras
	Escribir "Fin de impresión de boletas de calificaciones"
	
FinAlgoritmo
