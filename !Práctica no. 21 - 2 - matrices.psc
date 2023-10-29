Algoritmo sin_titulo
	//Se tiene una matriz de 5 x 10 en donde la fila principal es fija pero la columna
	// 0 con 0, 0 con 1, 0 con 2, 0 con 3, 0 con 4 son variables dado los valores ingresados en dicha
	//columna, mostrar en la matriz a los valores de las multiplicaciones segun los parametros
	//ingresados en la columna 0
	//tabla de multiplicar del 1 al 9, la columna es variable
	//Una vez ingresado los valores de la tabla a calcular se deberá identificar los multiplos comunes
	// que comparten dos o más números
	Dimension matriz[5,10];
	//Se asignan los valores de la columna
	Dimension coincidencias[54];
	Para x<-1 Hasta 4 Hacer
		Escribir "Escribe el valor de la columna " x;
		Leer matriz[x,0];
	FinPara
	//Se asignan los valores de las filas
	Para z<-1 Hasta 9 Hacer
		matriz[0,z]<-z;
	FinPara
	Para x<-1 Hasta 4 Hacer
		Para z<-1 Hasta 9 Hacer
			matriz[x,z]<-matriz[x,0]*matriz[0,z];
		FinPara
	FinPara
	Escribir "   M A T R I Z";
	Escribir " ";
	Para x<-0 Hasta 4 Hacer
		Para z<-0 Hasta 9 Hacer
			Si x=0 Entonces
				Escribir Sin Saltar "    ", matriz[x,z];
			SiNo
				Si matriz[x,z]>1000 Entonces
					Escribir Sin Saltar " ", matriz[x,z];
				SiNo
					Si matriz[x,z]>100 Entonces
						Escribir Sin Saltar "  ", matriz[x,z];
					SiNo
						Si matriz[x,z]>=10 Entonces
							Escribir Sin Saltar "   ", matriz[x,z];
						SiNo
							Si matriz[x,z]<10 Entonces
								Escribir Sin Saltar "    ", matriz[x,z];
							FinSi
						FinSi
					FinSi	
				FinSi
			FinSi
		FinPara
		Escribir ""
	FinPara
	Escribir " "
	//Se encuentran los multiplos que coinciden de cada numero
	Para x<-1 Hasta 4 Hacer
		Para z<-1 Hasta 9 Hacer
			Para t<--3 Hasta 3 Hacer
				Si x+t>x y x+t<5 Entonces
				multiplos<-0;
				Si matriz[x,z]=matriz[x+t,z] Entonces
					multiplos<-multiplos+1
						Si multiplos=1 Entonces
							coincidencias[m]<-matriz[x,z];
							m<-m+1
					FinSi
				SiNo
					Para s<-1 Hasta 8 Hacer
						Si z-s>0 Entonces
							Si matriz[x,z]=matriz[x+t,z-s] Entonces
								multiplos<-multiplos+1;
								Si multiplos=1 Entonces
									coincidencias[m]<-matriz[x,z];
									m<-m+1
								FinSi
							FinSi
						FinSi
						Si z+s<10 Entonces
							Si matriz[x,z]=matriz[x+t,z+s] Entonces
								multiplos<-multiplos+1;
								Si multiplos=1 Entonces
									coincidencias[m]<-matriz[x,z];
									m<-m+1
								FinSi
							FinSi
						FinSi
					FinPara
				FinSi
			FinSi
			FinPara
		FinPara
	FinPara
	//Se ordenan los multiplos
	Para x<-0 Hasta m-2 Hacer
		ant<-x;
		Para z<-x+1 Hasta m-1 Hacer
			Si coincidencias[z]<coincidencias[ant] Entonces
				ant<-z;
			FinSi
		FinPara
		auxn<-coincidencias[x];
		coincidencias[x]<-coincidencias[ant]
		coincidencias[ant]<-auxn;
	FinPara
	//Se imprimen los multiplos
	Para t<-0 Hasta m-1 Hacer
		Si t>1 Entonces
			Si coincidencias[t]<>coincidencias[t-1] Entonces
				Escribir "Los números con multiplo " , coincidencias[t], " son:"
				Para x<-1 Hasta 4 Hacer 
					Para z<-1 Hasta 9 Hacer
						Si matriz[x,z]=coincidencias[t] Entonces
							Escribir "El número ", matriz[x,0];
						FinSi
					FinPara
				FinPara
			FinSi
		SiNo
			Escribir "Los números con multiplo " , coincidencias[t], " son:"
			Para x<-1 Hasta 4 Hacer 
				Para z<-1 Hasta 9 Hacer
					Si matriz[x,z]=coincidencias[t] Entonces
						Escribir "El número ", matriz[x,0];
					FinSi
				FinPara
			FinPara
		FinSi
	FinPara
FinAlgoritmo
