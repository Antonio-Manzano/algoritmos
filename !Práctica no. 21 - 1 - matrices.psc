Algoritmo sin_titulo
	Definir matriz como Entero 
	//Se tiene una matriz de 4x4, realizar las siguientes operaciones
	Dimension matriz[4,4];
	//Llenar la matriz con valores enteros aleatorios entre 1 y 100 y después imprimirla
	//Encontrar el valor máximo y mínimo de la matriz e imprimirlos e indicar en que posición se encuentran
	//Calcular la suma de los elementos de la diagonal principal de la matriz y mostrar resultado, elevando al cuadrado ese resultado y mostrarlo
	//Calcular la suma de los elementos que están por encima de la diagonal de la matriz y mostrar resultado en pantalla
	Dimension in[6];
	//Se asignan valores aleatorios a cada espacio de la matriz
	Para x<-0 Hasta 3 Hacer
		Para z<-0 Hasta 3 Hacer
			matriz[x,z]<-aleatorio(1,100);
		FinPara
	FinPara
	//Se comparan todos los números de la matriz para encontrar el mayor
	Para x<-0 Hasta 3 Hacer
		Para z<-0 Hasta 3 Hacer
			Si matriz[x,z]>in[0] Entonces
				in[0]<-matriz[x,z];
				//Se asigna la columna
				in[1]<-z+1;
				//Se asigna la fila
				in[2]<-x+1;
			FinSi
		FinPara
	FinPara
	//Se asigna el número mayor de la matriz para compararlo la primera vez para encontrar el número menor
	in[3]<-in[0];
	//Se comparan todos los números de la matriz para encontrar el menor
	Para x<-0 Hasta 3 Hacer
		Para z<-0 Hasta 3 Hacer
			Si matriz[x,z]<in[3] Entonces
				in[3]<-matriz[x,z];
				//Se asigna la columna
				in[4]<-z+1;
				//Se asigna la fila
				in[5]<-x+1;
			FinSi
		FinPara
	FinPara
	//Se suman los números de la diagonal principal
	Para z<-0 Hasta 3 Hacer
		diagonal<-matriz[z,z]+diagonal;
	FinPara
	//Se suman los números sobre la diagonal
	Para z<-0 Hasta 2 Hacer
		sdiagonal<-matriz[z,z+1]+sdiagonal;
	FinPara
	//Se imprime la matriz
	Escribir "   M A T R I Z";
	Escribir " ";
	Para x<-0 Hasta 3 Hacer
		Si x=0 Entonces
			Escribir "    |1||2||3||4|";
		FinSi
		Escribir Sin Saltar "|", x+1,"|";
		Para z<- 0 Hasta 3 Hacer
			Escribir Sin Saltar " " matriz[x,z]
		FinPara
		Escribir ""
	FinPara
	Escribir " "
	//Se imprime el valor máximo y minimo de la matriz, así como en donde se encuentra
	Escribir "----------------------------------------------------------------------"
	Escribir "El valor maximo de la matriz es ", in[0]," columna ", in[1]," fila ", in[2];
	Escribir "El valor mínimo de la matriz es ", in[3]," columna ", in[4]," fila ", in[5];
	Escribir "----------------------------------------------------------------------"
	//Se imprime la suma de la diagonal y su cuadrado
	Escribir "La suma de la diagonal principal es ", diagonal, " y su cuadrado es " diagonal^2;
	//Se imprime la suma de los números sobre la diagonal
	Escribir "La suma de los elementos que están por encima de la diagonal es ", sdiagonal;
	Escribir "-----------------------------------------------------------------------"
FinAlgoritmo
