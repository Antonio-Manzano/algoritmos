Algoritmo Limsup_liminf
	Escribir "�Cu�l es el l�mite superior?" //Se preguntan los l�mites superior e inferior
	Leer limsup 
	Escribir "�Y el l�mite inferior?"
	Leer liminf
	Repetir                                                //Se crea un bucle que termine en el momento en que se ingrese el n�mero 0
		Escribir "Introduce los n�meros que te plazcan"    
		Leer num1  //Se leen los n�meros que se quieran encontrar si est�n dentro o fuera del intervalo                                   
		Si (num1<=limsup) y (num1>=liminf) Entonces //Condicional que pregunta si el n�mero recibido est� dentro del l�mite
			inlimit<-inlimit+1 //Se a�ade uno a la variable que contiene sumatoria de la cantidad de n�meros dentro del l�mite
			num3<-num1 //Se asigna el n�mero a otra variable para que no intervenga en el proceso principal
			num2<-num3+num2 //Se suma con otra variable que guarda las sumas de los n�meros anteriores
			Si(num1=limsup) o (num1=liminf) Entonces //Condicional para preguntar si un n�mero est� literalmente en un l�mite
				islimit<-islimit+1 //Se a�ade uno a la variable que contiene la sumatoria de la cantidad de n�meros en el l�mite
			FinSi
		Sino //Condicional que recibe si un n�mero no est� en el intervalo
			outlimit<-outlimit+1 //Se a�ade uno a la variable que contiene la sumatoria de la cantidad de n�meros fuera del l�mite
		FinSi
	Hasta Que (num1=0)
	Escribir "La suma de los n�meros dentro del intervalo es igual a " num2 //Se imprime la suma de los n�meros en el intervalo
	Escribir "Hay " outlimit " n�meros fuera del intervalo" //Se imprime la cantidad de n�meros fuera del intervalo
	Escribir "Se han colocado " islimit " n�meros en los limites del intervalo" //Se imprime la cantidad de n�meros en los l�mites del intervalo
FinAlgoritmo
