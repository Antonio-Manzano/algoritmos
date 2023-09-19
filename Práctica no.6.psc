Algoritmo ciclo_alumnos
	respuesta<-"Si"
	Escribir "A continuación escribe las calificaciones de cada alumno"
	Mientras (respuesta="Si") Hacer //Pedirá el nombre del alumno y la calificación en 4 unidades
		Escribir "¿Cuál es el nombre del alumno?"
		Leer nombre
		Escribir "¿Cuál es su calificación de la primera unidad?"
		Leer calif1
		Escribir "¿Cuál es su calificación de la segunda unidad?"
		Leer calif2
		Escribir "¿Cuál es su calificación de la tercera unidad?"
		Leer calif3
		Escribir "¿Cuál es su calificación de la cuarta unidad?"
		Leer calif4
		n<-1+n //variable para la cantidad "N" de alumnos
		promedio<-(calif1+calif2+calif3+calif4)/4 //promedio de las 4 unidades
		sumaalumnos<-promedio+sumaalumnos//variable para sumar el promedio total de cada alumno a una suma total
		promediogrupal<-sumaalumnos/n //variable para promediar el grupo, dividiendo la suma de promedios entre los alumnos totales
		alumnoanterior<-promedioanterior//variable para ver quien tiene mayor promedio
		Si (promedio<70) Entonces //Se compara el promedio de alumno a la barrera de aprobación
			reprobados<-reprobados+1
		SiNo //variables para conocer el número de aprobados y reprobados
			aprobados<-aprobados+1
		FinSi
		Si (promedio>alumnoanterior) Entonces //Se compara el promedio por el anterior para conocer cual es el más alto
			califalta<-promedio
			acalifalta<-nombre
		FinSi
		Si (calif1>calif2 y calif1>calif3 y calif1>calif4) Entonces //Se comparan calificaciones para descubrir cual unidad es en la que posee
			unidad<- "Unidad 1"                                       //el promedio más alto
			SiNo
				Si (calif2>calif3 y calif2>calif3 y calif2>calif4) Entonces
					unidad<- "Unidad 2"
				SiNo
					Si (calif1>calif4 y calif3>calif2 y calif3>calif4) Entonces
						unidad<- "Unidad 3"
					SiNo
						unidad<- "Unidad 4"
				FinSi
			FinSi
		FinSi
	promedioanterior<-promedio //variable para que se use el promedio actual en el próximo ciclo
	Escribir "¿Quiere añadir un alumno más? Si/No" //Se pregunta si quiere añadir más alumnos para hacer un próximo ciclo
	leer respuesta
	FinMientras
	Escribir "La media de calificación grupal es de " promediogrupal
	Escribir "La calificación con mayor promedio es " califalta
	Escribir "El alumno con mayor calificación es " acalifalta
	Escribir "La unidad que presentó la calificación más alta fue " unidad
	Escribir "El número total de aprobados es " aprobados " y de reprobados " reprobados
FinProceso
