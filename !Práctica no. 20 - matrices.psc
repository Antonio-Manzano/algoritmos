Algoritmo Sucursales_y_piezas
	Definir x, z, s, p como Entero
	//26 de octubre del 2023 a 5:50 pm
	//Un almacen dispone de N sucursales en cada una de las cuales se venden X piezas (Todas las piezas se venden en todas las sucursales) 
	//se dispone de una matriz de existencias de cada pieza en cada sucursal 
	//a)Cual es el total de piezas en cada sucursal
	//b)Cual es la pieza que existe en menor cantidad en todas las sucursales 
	//c)Cual es la sucursal que tiene mas del 50% del total de las piezas repartidas en todas las sucursales 
	//d)Cual es la pieza y en que sucursal esta cuyo precio es mayor a 10k pesos
	Escribir "¿Cuantas sucursales tiene el almacen?";
	Leer s;
	Escribir "¿Cuántas piezas tiene cada sucursal?";
	Leer p;
	Dimension almacen[s,p];
	Dimension totalpiezas[s];
	Dimension menorpiezas[p];
	Dimension ipieza[p];
	Dimension precios[s,p];
	Dimension menorsucursal[p];
	//Se identifica la cantidad de cada pieza en cada sucursal
	Para x<-0 Hasta s-1 Hacer
		Para z<-0 Hasta p-1 Hacer
			Escribir "Con cuanta cantidad de piezas ", z+1," cuenta la sucursal ", x+1, "?";
			Leer almacen[x,z];
		FinPara
	FinPara
	//Se suman las piezas de cada sucursal a un vector y también la pieza individual en cada vector
	Para x<-0 Hasta s-1 Hacer
		Para z<-0 Hasta p-1 Hacer
			totalpiezas[x]<-almacen[x,z]+totalpiezas[x];
			menorpiezas[z]<-almacen[x,z]+menorpiezas[z];
		FinPara
	FinPara
	//Se piden los precios de cada pieza
	Para x<-0 Hasta s-1 Hacer
		Para z<-0 Hasta p-1 Hacer
		Escribir "¿Cuál es el precio de la pieza ", z+1," en la sucursal ", x+1, "?";
		Leer precios[x,z];
		FinPara
	FinPara
	//Se imprime la matriz de almacen
	Escribir "---------------------------------------------------------------------------------------"
	Escribir "Las piezas de cada sucursal son:";
	Para x<-0 Hasta s-1 Hacer
		Escribir " ";
		Para z<-0 Hasta p-1 Hacer
			Si z=0 Entonces
				Escribir Sin Saltar " Sucursal ", x+1,": |",almacen[x,z] ,"|";
			SiNo
				Escribir Sin Saltar " |", almacen[x,z], "|";
			FinSi
		FinPara
	FinPara
	Escribir " ";
	//Se imprime la matriz de precios
	Escribir "---------------------------------------------------------------------------------------"
	Escribir "Los precios de cada pieza de cada sucursal son:";
	Para x<-0 Hasta s-1 Hacer
		Escribir " ";
		Para z<-0 Hasta p-1 Hacer
			Si z=0 Entonces
				Escribir Sin Saltar " Sucursal ", x+1,": |",precios[x,z] ,"|";
			SiNo
				Escribir Sin Saltar " |", precios[x,z], "|";
			FinSi
		FinPara
	FinPara
	Escribir " ";
	//Ingreso un identificador de  piezas para meterlo al comparar de piezas y saber cual es
	Para x<-0 Hasta p-1 Hacer
		ipieza[x]<-x+1;
	FinPara
	Para x<-0 Hasta s-1 Hacer
		//Se calcula el total global de piezas
		globalpiezas<-totalpiezas[x]+globalpiezas
	FinPara
	//Se identifica la pieza de menor cantidad de cada sucursal mediante comparaciones
	Para x<-0 Hasta s-1 Hacer
		menorsucursal[x]<-globalpiezas
		Para z<-0 Hasta p-1 Hacer
			Si almacen[x,z]<menorsucursal[x] Entonces
				menorsucursal[x]<-almacen[x,z];
				ipieza[x]<-z+1
			FinSi
		FinPara
	FinPara
	//a)
	Para x<-0 Hasta s-1 Hacer
		Escribir "---------------------------------------------------------------------------------------"
		Escribir "El total de piezas de la sucursal número ", x+1, " es de ", totalpiezas[x], " piezas.";
		Escribir "La pieza con menor cantidad esta sucursal es la número ", ipieza[x], " con un total de ", menorsucursal[x]," piezas";
	FinPara
	Escribir "---------------------------------------------------------------------------------------"
	//Ingreso un identificador de  piezas para meterlo al comparar de piezas y saber cual es
	Para x<-0 Hasta p-1 Hacer
		ipieza[x]<-x+1;
	FinPara
	//Se compara la cantidad de cada pieza en cada sucursal
	Para x<-0 Hasta p-2 Hacer
		Para z<-0 Hasta p-2 Hacer
			Si menorpiezas[z]>menorpiezas[z+1] Entonces
				aux<-menorpiezas[z];
				menorpiezas[z]<-menorpiezas[z+1];
				menorpiezas[z+1]<-aux;
				auxi<-ipieza[z];
				ipieza[z]<-ipieza[z+1];
				ipieza[z+1]<-auxi;
			FinSi
		FinPara
	FinPara
	//b)
	//Se compara la cantidad de cada pieza
	Para x<-0 Hasta 0 Hacer
		Escribir "La pieza en menor cantidad en todas las sucursales es la ", ipieza[x], " con una cantidad de ", menorpiezas[x], " piezas.";
	FinPara
	Escribir "---------------------------------------------------------------------------------------"
	//Se inicia un bucle para sumar piezas
	Para x<-0 Hasta s-1 Hacer
		//Se compara el total de cada sucursal con el 50% del global, y si es mayor al 50% se imprime
		Si totalpiezas[x]>globalpiezas*.5 Entonces
			Escribir "La sucursal número ", x+1, " contiene más del 50% del total de piezas repartidas en todas las sucursales.";
		FinSi
	FinPara
	Escribir "---------------------------------------------------------------------------------------"
	//Se inicia un bucle para comparar toda la matriz precios
	Para x<-0 Hasta s-1 Hacer
		Para z<-0 Hasta p-1 Hacer
			//Se compara cada espacio del vector para saber cual pieza vale más de 10000
			Si  precios[x,z]>10000 Entonces
				Escribir "La pieza con un valor mayor a $10000 es la pieza ", z+1, " en la sucursal ", x+1, " con un precio de ", precios[x,z];
			FinSi
		FinPara
	FinPara
	Escribir "---------------------------------------------------------------------------------------"
	
	

	
FinAlgoritmo
