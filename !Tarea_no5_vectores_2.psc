Algoritmo VectoresA_B_C
	Definir A, B, C, n Como Entero;
	n<-0;
	//Se declaran los vectores "A", "B" y "C" con capacidad de 45 elementos
	Dimension A[45];
	Dimension B[45];
	Dimension C[45];
	Escribir "Ingresando 45 números al vector A y al vector B";
	//Se inicia un bucle para asignar 45 números a cada vector
	Para n<-1 hasta 45 Hacer
		//Se asignan 45 elementos al vector A (números del 1 al 45)
		A[n]<-n;
		//Se asignan 45 elementos al vector B (cada elemento del vector B es el doble del elemento correspondiente del vector A)
		B[n]<-n*2;
		//Se suman los 45 elementos del vector A y del vector B, y se asignan al vector C
		C[n]<-A[n]+B[n];
		//Se imprimen la cantidad de cada elemento de los vectores A y B, y la suma de estos asignada en el vector C
		Escribir "La suma del elemento ", n," de A (" A[n], ") y el elemento ", n, " de B (", B[n], ") es ", C[n];
	FinPara
FinAlgoritmo
