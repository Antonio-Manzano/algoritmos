Algoritmo Candidatura
	//Cargar en dos arreglas uno con cantidad de datos y cantidad de votos
	//Imprimir los nombres de los 3 candidatos con mayor cantidad de votos
	//Así mismo, deberá identificarse al candidato que no haya obtenido 10% de votación total
	//Para que se mande un mensaje indicando que ese candidato queda fuera de futuras elecciones
	//Se deberá imprimir el nombre de menor a mayor y de mayor a menor
	
	//Se definen las variables
	Definir votos, n, x, totalvotos, fuera Como Enteros
	Definir diezporciento Como Real
	Definir candidatos Como Caracter
	Escribir "Registro de votos de candidatura";
	//Se pregunta por la cantidad de postulantes
	Escribir "¿Cuántos candidatos hay?";
	Leer n;
	
	//Se dimensionan dos variables de acuerdo a la cantidad de postulantes
	Dimension candidatos[n];
	Dimension votos[n];
	
	//Se inicia un bucle para pedir el nombre del candidato y sus votos correspondientes
	Para x<-1 Hasta n Hacer
		Escribir "¿Cuál es el nombre del candidato número ", x, "?";
		Leer candidatos[x];
		Escribir "¿Cuál es su cantidad de votos?";
		Leer votos[x];
		//Se suman todos los votos en una variable llamada "totalvotos"
		totalvotos<-votos[x]+totalvotos
	FinPara
	
	Escribir "------------------------";
	Escribir "       CANDIDATOS       ";
	Escribir "------------------------";
	//Se imprimen los candidatos y los votos de todos los candidatos
	Para x<-1 Hasta n Hacer
		Escribir " ", candidatos[x], " tiene ", votos[x], " votos";
	FinPara
	
	//Se acomodan los candidatos por orden alfabetico y con sus correspondientes votos
	Para x<-1 Hasta n-1 Hacer
		letra<-x
		Para z<-x+1 Hasta n Hacer
			Si candidatos[z]<candidatos[letra] Entonces
				letra<-z;
			FinSi
		FinPara
		auxn<-candidatos[x];
		candidatos[x]<-candidatos[letra];
		candidatos[letra]<-auxn;
		aux<-votos[x];
		votos[x]<-votos[letra];
		votos[letra]<-aux;
	FinPara
	
	//Se acomodan los candidatos por mayor cantidad de votos
	Para x<-1 Hasta n-1 Hacer
		Para z<-1 Hasta n-1 Hacer
			si votos[z]<votos[z+1] Entonces
				aux<-votos[z];
				votos[z]<-votos[z+1];
				votos[z+1]<-aux;
				auxn<-candidatos[z];
				candidatos[z]<-candidatos[z+1];
				candidatos[z+1]<-auxn;
			FinSi
		FinPara
	FinPara
	
	Escribir "------------------------";
	Escribir "          TOP3          ";
	Escribir "------------------------";
	//Se imprimen los 3 candidatos con mayores votos
	Para x<-1 Hasta 3 Hacer
		Escribir x,".", candidatos[x]," con ", votos[x], " votos.";
	FinPara
	Escribir "------------------------";
	Escribir "      MAYOR A MENOR     ";
	Escribir "------------------------";
	//Se imprimen los candidatos de mayor a menor
	Para x<-1 Hasta n Hacer
		Escribir " ", candidatos[x]," con ", votos[x], " votos.";
	FinPara
	Escribir "------------------------";
	Escribir "      MENOR A MAYOR     ";
	Escribir "------------------------";
	//Se imprimen los candidatos de mayor a menor
	Para x<-n Hasta 1 Hacer
		Escribir " ", candidatos[x]," con ", votos[x], " votos.";
	FinPara
	//Se asigna el 10% del total de votos a una variable
	diezporciento<-totalvotos*.10;
	//Se asigna el total de candidatos fuera de futuras elecciones
	Para x<-1 Hasta n Hacer
		Si votos[x]<diezporciento Entonces
			fuera<-fuera+1;
		FinSi
	FinPara
	//Si hay uno o más candidatos fuera de las elecciones se imprimen los candidatos
	Si fuera>=1 Entonces
		Escribir "------------------------------------------------------------";
		Escribir "                   MENOR AL 10% DE VOTOS                    ";
		Escribir "------------------------------------------------------------";
		Escribir "              Nota: El 10% de los votos es ", diezporciento, " votos."
		Escribir "------------------------------------------------------------";
		Para x<-1 Hasta n Hacer
			Si votos[x]<diezporciento Entonces
				Escribir " ", candidatos[x]," está fuera de futuras elecciones por tener ", votos[x], " votos";
			FinSi
		FinPara
		Escribir "------------------------------------------------------------";
	SiNo
		Escribir "------------------------------------------------------------";
	FinSi
	
FinAlgoritmo
