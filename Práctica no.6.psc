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
		alumnoanterior<-promedioanterior//variable que ayuda a saber quien tiene mayor promedio de los alumnos en un ciclo
		Si (promedio<70) Entonces //Se compara el promedio de alumno a la barrera de aprobación
			reprobados<-reprobados+1
		SiNo //variables para conocer el número de aprobados y reprobados
			aprobados<-aprobados+1
		FinSi
		Si (promedio>alumnoanterior) Entonces //Se compara el promedio por el anterior para conocer cual es el más alto
			califalta<-promedio
			acalifalta<-nombre
			Si (califtotal1>califtotal2 y califtotal1>califtotal3 y califtotal1>califtotal4) Entonces //Se comparan calificaciones para descubrir cual unidad es en la que se
			unidad<- "Unidad 1"                                       // posee el promedio más alto
			calift1<- califtotal1/n
			SiNo
				Si (califtotal2>califtotal3 y califtotal2>califtotal3 y califtotal2>califtotal4) Entonces
					unidad<- "Unidad 2"
				SiNo
					Si (califtotal3>califtotal4 y califtotal3>califtotal2 y califtotal3>califtotal4) Entonces
						unidad<- "Unidad 3"
					SiNo
						unidad<- "Unidad 4"
				FinSi
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
