Algoritmo ciclo_alumnos
	respuesta<-"Si"
	Escribir "A continuaci�n escribe las calificaciones de cada alumno"
	Mientras (respuesta="Si") Hacer //Pedir� el nombre del alumno y la calificaci�n en 4 unidades
		Escribir "�Cu�l es el nombre del alumno?"
		Leer nombre
		Escribir "�Cu�l es su calificaci�n de la primera unidad?"
		Leer calif1
		Escribir "�Cu�l es su calificaci�n de la segunda unidad?"
		Leer calif2
		Escribir "�Cu�l es su calificaci�n de la tercera unidad?"
		Leer calif3
		Escribir "�Cu�l es su calificaci�n de la cuarta unidad?"
		Leer calif4
		n<-1+n //variable para la cantidad "N" de alumnos
		promedio<-(calif1+calif2+calif3+calif4)/4 //promedio de las 4 unidades
		sumaalumnos<-promedio+sumaalumnos//variable para sumar el promedio total de cada alumno a una suma total
		promediogrupal<-sumaalumnos/n //variable para promediar el grupo, dividiendo la suma de promedios entre los alumnos totales
		alumnoanterior<-promedioanterior//variable para ver quien tiene mayor promedio
		Si (promedio<70) Entonces //Se compara el promedio de alumno a la barrera de aprobaci�n
			reprobados<-reprobados+1
		SiNo //variables para conocer el n�mero de aprobados y reprobados
			aprobados<-aprobados+1
		FinSi
		Si (promedio>alumnoanterior) Entonces //Se compara el promedio por el anterior para conocer cual es el m�s alto
			califalta<-promedio
			acalifalta<-nombre
		FinSi
		Si (calif1>calif2 y calif1>calif3 y calif1>calif4) Entonces //Se comparan calificaciones para descubrir cual unidad es en la que posee
			unidad<- "Unidad 1"                                       //el promedio m�s alto
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
	promedioanterior<-promedio //variable para que se use el promedio actual en el pr�ximo ciclo
	Escribir "�Quiere a�adir un alumno m�s? Si/No" //Se pregunta si quiere a�adir m�s alumnos para hacer un pr�ximo ciclo
	leer respuesta
	FinMientras
	Escribir "La media de calificaci�n grupal es de " promediogrupal
	Escribir "La calificaci�n con mayor promedio es " califalta
	Escribir "El alumno con mayor calificaci�n es " acalifalta
	Escribir "La unidad que present� la calificaci�n m�s alta fue " unidad
	Escribir "El n�mero total de aprobados es " aprobados " y de reprobados " reprobados
FinProceso
