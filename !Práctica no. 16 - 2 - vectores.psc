Algoritmo VectoresA_B_C
	Definir A, B, C, n Como Entero;
	n<-0;
	Dimension A[5];
	Dimension B[5];
	Dimension C[5];
	Escribir "Ingresando 5 números enteros al vector A y al vector B";
	Para n<-1 hasta 5 Hacer
		Escribir "Escribe el elemento ", n," del vector A";
		Leer A[n];
		Escribir "Escribe el elemento ", n," del vector B";
		Leer B[n];
	FinPara
	Para n<-1 Hasta 5 Hacer
		C[n]<-A[n]+B[n];
		//Se imprimen la cantidad de cada elemento de los vectores A y B, y la suma de estos asignada en el vector C
		Escribir "La suma del elemento ", n," de A (" A[n], ") y el elemento ", n, " de B (", B[n], ") es ", C[n];
	FinPara
FinAlgoritmo
