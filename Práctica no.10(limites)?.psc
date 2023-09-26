Algoritmo Limsup_liminf
	Escribir "¿Cuál es el límite superior?" //Se preguntan los límites superior e inferior
	Leer limsup 
	Escribir "¿Y el límite inferior?"
	Leer liminf
	Repetir                                                //Se crea un bucle que termine en el momento en que se ingrese el número 0
		Escribir "Introduce los números que te plazcan"    
		Leer num1  //Se leen los números que se quieran encontrar si están dentro o fuera del intervalo                                   
		Si (num1<=limsup) y (num1>=liminf) Entonces //Condicional que pregunta si el número recibido está dentro del límite
			inlimit<-inlimit+1 //Se añade uno a la variable que contiene sumatoria de la cantidad de números dentro del límite
			num3<-num1 //Se asigna el número a otra variable para que no intervenga en el proceso principal
			num2<-num3+num2 //Se suma con otra variable que guarda las sumas de los números anteriores
			Si(num1=limsup) o (num1=liminf) Entonces //Condicional para preguntar si un número está literalmente en un límite
				islimit<-islimit+1 //Se añade uno a la variable que contiene la sumatoria de la cantidad de números en el límite
			FinSi
		Sino //Condicional que recibe si un número no está en el intervalo
			outlimit<-outlimit+1 //Se añade uno a la variable que contiene la sumatoria de la cantidad de números fuera del límite
		FinSi
	Hasta Que (num1=0)
	Escribir "La suma de los números dentro del intervalo es igual a " num2 //Se imprime la suma de los números en el intervalo
	Escribir "Hay " outlimit " números fuera del intervalo" //Se imprime la cantidad de números fuera del intervalo
	Escribir "Se han colocado " islimit " números en los limites del intervalo" //Se imprime la cantidad de números en los límites del intervalo
FinAlgoritmo
