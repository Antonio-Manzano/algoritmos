Algoritmo Corredores
	Definir corredor, cmenor, cmenor2, cmenor3 Como Caracter
	Definir c, posicion como Entero
	Definir t, tmayor, tmenor, tmenor2, tmenor3, ttotal, tmedio Como Real
	//Se declaran los vectores "corredor", "t" y "posicion" con capacidad de 10 elementos
	Dimension corredor[10]
	Dimension t[10]
	Dimension posicion[10]
	Escribir "Registrando el tiempo de 10 corredores..."
	//Se inicia un bucle para asignar los nombres de los corredores y el tiempo de estos en los vectores "corredor" y "t" respectivamente
	Para c<-1 Hasta 10 Hacer
		Escribir "Escribe el nombre del corredor número ", c;
		Leer corredor[c];
		Escribir "¿Cúal es el tiempo de este corredor?";
		Leer t[c];
		//Se asigna un total de tiempo para ir sumando las cantidades
		ttotal<-t[c]+ttotal
		//Se guarda el tiempo medio en que se recorrio la carrera
		tmedio<-ttotal/c
		//Se comparan los tiempos para calcular cual es el corredor que mayor tiempo se tardo
		Si t[c]>tmayor Entonces
			tmayor<-t[c];
			cmayor<-corredor[c];
		FinSi
		//Se asigna "tmenor" con la cantidad de "tmayor" para que se pueda comparar la primera vez
		Si tmenor=0 Entonces
			tmenor<-tmayor
		FinSi
		//Se comparan los tiempos para calcular si el tiempo de un corredor es menor al del tiempo mayor
		Si t[c]<tmayor Entonces
			//Se comparan los tiempos  con el tiempo menor ya asignado para sacar el corredor que menor tiempo tardó
			Si t[c]<tmenor Entonces
			tmenor<-t[c];
			FinSi
		FinSi
	FinPara
	//Se inicia un bucle para saber cual es el segundo menor tiempo 
	Para c<-1 Hasta 10 Hacer
		//Se asigna tmenor2 como tmayor la primera vez que se inicie el bucle para poder comparar
		Si tmenor2=0 Entonces
			tmenor2<-tmayor
		FinSi
		//Se compara si es mayor al primer tiempo menor
		Si t[c]>tmenor Entonces
			//Se compara si es menor al tiempo mayor
			Si t[c]<tmayor Entonces
				Si t[c]<tmenor2 Entonces
					tmenor2<-t[c];
				FinSi
			FinSi
		FinSi
	FinPara
	//Se inicia un bucle para saber cual es el tercer menor tiempo 
	Para c<-1 Hasta 10 Hacer
		//Se asigna tmenor3 como tmayor la primera vez que se inicie el bucle para poder comparar
		Si tmenor3=0 Entonces
			tmenor3<-tmayor
		FinSi
		//Se compara si es mayor al segundo tiempo menor
		Si t[c]>tmenor2 Entonces
			//Se compara si es menor al tiempo mayor
			Si t[c]<tmayor Entonces
				//Se compara si es menor al tercer tiempo menor
				Si t[c]<tmenor3 Entonces
					//Se asigna como tercer tiempo menor
					tmenor3<-t[c];
			FinSi
		FinSi
	FinSi
	FinPara
	//Se inicia un bucle para conocer que elementos del vector son los que tienen el primer tiempo menor
	Para c<-1 Hasta 10 Hacer
		Si t[c]=tmayor Entonces
			//Se asigna 4 al vector "posicion" para poder identificar a los corredores con mayor tiempo
			posicion[c]<-4
			//Se suma uno a la asignación de ultimos para contar cuantos corredores tienen el mayor tiempo
			ultimos<-ultimos+1
		FinSi
	FinPara
	//Se inicia un bucle para conocer que elementos del vector son los que tienen el tercer tiempo menor
	Para c<-1 Hasta 10 Hacer
		Si t[c]=tmenor3 Entonces
			//Se asigna 2 al vector "posicion" para poder identificar a los corredores con tercer menor tiempo
			posicion[c]<-3
			//Se suma uno a la asignación de primeros para contar cuantos corredores tienen el tercer menor tiempo
			lugar3<-lugar3+1
		FinSi
	FinPara
	//Se inicia un bucle para saber cuantos corredores tienen el segundo menor tiempo
	Para c<-1 Hasta 10 Hacer
		Si t[c]=tmenor2 Entonces
			//Se asigna 2 al vector "posicion" para poder identificar a los corredores con segundo menor tiempo
			posicion[c]<-2;
			//Se suma uno a la asignación de primeros para contar cuantos corredores tienen el segundo menor tiempo
			lugar2<-lugar2+1
		FinSi
	FinPara
	//Se inicia un bucle para conocer que elementos del vector son los que tienen el segundo tiempo menor
	Para c<-1 Hasta 10 Hacer
		Si t[c]=tmenor Entonces
			//Se asigna 1 al vector "posicion" para poder identificar a los corredores con menor tiempo
			posicion[c]<-1;
			//Se suma uno a la asignación de primeros para contar cuantos corredores tienen el menor tiempo
			lugar1<-lugar1+1
		FinSi
	FinPara
	//Se pregunta si son mayor a 1 los corredores que ocupan el primer lugar para imprimir el escrito en plural
	Si lugar1>1 Entonces 
		Escribir "Los corredores que alcanzaron el primer lugar fueron: ";
	SiNo
		//No se comprueba la condición y se escribe en singular
		Escribir "El corredor que alcanzo el primer lugar fue: ";
	FinSi
	//Se inicia un bucle para imprimir el tiempo de los corredores que son primer lugar
	Para c<-1 Hasta 10 Hacer
		Si posicion[c]=1 Entonces
			Escribir "", corredor[c], " con un tiempo de ", t[c];
		FinSi
	FinPara
	//Se pregunta si son mayor a 1 los corredores que ocupan el segundo lugar para imprimir el escrito en plural
	Si lugar2>1 Entonces 
		Escribir "Los corredores que alcanzaron el segundo lugar fueron: ";
	SiNo
		//No se comprueba la condición y se escribe en singular
		Escribir "El corredor que alcanzo el segundo lugar fue: ";
	FinSi
	//Se inicia un bucle para imprimir el tiempo de los corredores que son segundo lugar
	Para c<-1 Hasta 10 Hacer
		Si posicion[c]=2 Entonces
			Escribir "", corredor[c], " con un tiempo de ", t[c];
		FinSi
	FinPara
	//Se pregunta si son mayor a 1 los corredores que ocupan el tercer lugar para imprimir el escrito en plural
	Si lugar3>1 Entonces 
		Escribir "Los corredores que alcanzaron el tercer lugar fueron: ";
	SiNo
		//No se comprueba la condición y se escribe en singular
		Escribir "El corredor que alcanzo el tercer lugar fue: ";
	FinSi
	//Se inicia un bucle para imprimir el tiempo de los corredores que son tercer lugar
	Para c<-1 Hasta 10 Hacer
		Si posicion[c]=3 Entonces
			Escribir "", corredor[c], " con un tiempo de ", t[c];
		FinSi
	FinPara
	//Se pregunta si son mayor a 1 los corredores que ocupan el ultimo lugar para imprimir el escrito en plural
	Si ultimos>1 Entonces 
		Escribir "Los corredores que quedaron como ultimo lugar fueron: ";
	SiNo
		//No se comprueba la condición y se escribe en singular
		Escribir "El corredor que alcanzó el ultimo lugar fue: ";
	FinSi
	//Se inicia un bucle para imprimir el tiempo de los corredores que son último lugar
	Para c<-1 Hasta 10 Hacer
		Si posicion[c]=4 Entonces
			Escribir "", corredor[c], " con un tiempo de ", t[c];
		FinSi
	FinPara
	Escribir "El tiempo medio en el que se recorrio la carrera fue de: ", tmedio;
FinAlgoritmo
