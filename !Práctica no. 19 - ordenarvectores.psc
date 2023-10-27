Algoritmo Ordenarempleados
	Definir n, x, ant, z Como Entero
	Definir horastrabajadas Como Entero
	Definir empleados, cedula Como Caracter
	//vector de objetos de n empleados nombre cedula horas trabajadas
	//la hora si el suedo es hasta 500 el estado es pesimo 800 regular 1000 bueno >1000 excelente
	//imprimir el estado de empleados ordenarlo por nombre
	Escribir "¿Cuántos empleados hay?";
	Leer n;
	//Se asigna el espacio de los vectores
	Dimension empleados[n];
	Dimension cedula[n];
	Dimension horastrabajadas[n];
	//Se pregunta por los datos y se guardan en los vectores
	Para x<-1 Hasta n Hacer
		Escribir "¿Cuál es el nombre del empleado?";
		Leer empleados[x];
		Escribir "¿Cuál es la cedula del empleado?";
		Leer cedula[x];
		Escribir "¿Cuántas son las horas trabajadas por empleado?";
		Leer horastrabajadas[x];
	FinPara
	//Se ordenan en orden alfabetico
	Para x<-1 Hasta n-1 Hacer
		ant<-x;
		Para z<-x+1 Hasta n Hacer
			Si empleados[z]<empleados[ant] Entonces
				ant<-z;
			FinSi
		FinPara
		auxn<-empleados[x];
		empleados[x]<-empleados[ant];
		empleados[ant]<-auxn;
		auxn1<-cedula[x];
		cedula[x]<-cedula[ant];
		cedula[ant]<-auxn1;
		auxn2<-horastrabajadas[x];
		horastrabajadas[x]<-horastrabajadas[ant];
		horastrabajadas[ant]<-auxn2;
	FinPara
	//Se catalogan en diferentes estados
	Para x<-1 Hasta n Hacer
		estado<-horastrabajadas[x]*7;
		Si estado<=500 Entonces
			Escribir "El empleado ", empleados[x]," con cedula ", cedula[x], " tiene un estado pésimo debido a que le pagan ", estado;
		SiNo
			Si estado<=800 Entonces
				Escribir "El empleado ", empleados[x]," con cedula ", cedula[x], " tiene un estado regular debido a que le pagan ", estado;
			SiNo
				Si estado<=1000 Entonces
					Escribir "El empleado ", empleados[x]," con cedula ", cedula[x], " tiene un estado bueno debido a que le pagan ", estado;
				SiNo
					Si estado>1000 Entonces
						Escribir "El empleado ", empleados[x]," con cedula ", cedula[x], " tiene un estado excelente debido a que le pagan ", estado;
					FinSi
				FinSi
			FinSi
		FinSi
	FinPara
FinAlgoritmo
