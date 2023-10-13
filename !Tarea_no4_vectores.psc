Algoritmo Tarea_no4_vectores
	Definir elementos, n, cant, multi Como Real
	Escribir "¿Cuántos elementos quiere escribir?";
	Leer n;
	Dimension elementos[n];
	Para multi<-1 hasta n Hacer
		Escribir "Escriba el elemento ", multi, ".";
		Leer elementos[multi];
		Si elementos[multi]%6=0 Entonces
			cant<-cant+1
		FinSi
		Si multi=n Entonces
			Escribir "Hay ", cant, " elementos multiplos de 6."
		FinSi
	FinPara
	
	Para multi<-1 hasta n Hacer
		Si elementos[multi]%6=0 Entonces
			Escribir "El elemento ", multi, ", ", elementos[multi], " es un multiplo de 6."
		FinSi
	FinPara
FinAlgoritmo
