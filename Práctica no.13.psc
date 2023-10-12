Algoritmo Productos_plato_costo
	Definir n, costo, total Como Real
	Escribir "Inicializando costo de productos para la preparación de un plato...";
	Escribir "¿Cuánta es la cantidad de productos que se necesita?";
	Leer n;
	Dimension costo[n];
	Para p<-1 Hasta n Hacer
		Escribir "¿Cuál es el costo del producto ", p "?";
		Leer costo[p];
		//suma del costo de todos los productos
		total<-costo[p]+total;
	FinPara
	Para p<-1 Hasta n Hacer
		Escribir "El costo del producto ", p, " es de $", costo[p], ".";
	FinPara
	Escribir "El costo total de los productos para el plato es de $", total, ".";
FinAlgoritmo
