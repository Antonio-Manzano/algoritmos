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
		alumnoanterior<-promedioanterior//variable que ayuda a saber quien tiene mayor promedio de los alumnos en un ciclo
		Si (promedio<70) Entonces //Se compara el promedio de alumno a la barrera de aprobaci�n
			reprobados<-reprobados+1
		SiNo //variables para conocer el n�mero de aprobados y reprobados
			aprobados<-aprobados+1
		FinSi
		Si (promedio>alumnoanterior) Entonces //Se compara el promedio por el anterior para conocer cual es el m�s alto
			califalta<-promedio
			acalifalta<-nombre
			Si (califtotal1>califtotal2 y califtotal1>califtotal3 y califtotal1>califtotal4) Entonces //Se comparan calificaciones para descubrir cual unidad es en la que se
			unidad<- "Unidad 1"                                       // posee el promedio m�s alto
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
