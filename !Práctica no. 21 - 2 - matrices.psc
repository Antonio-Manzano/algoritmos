Algoritmo Multiplos
	Definir f, c, x, z, t, s, m, ant Como Entero
	Definir matriz, aux Como Real
	Definir multi Como Entero
	//Se tiene una matriz de 5 x 10 en donde la fila principal es fija pero la columna
	// 0 con 0, 0 con 1, 0 con 2, 0 con 3, 0 con 4 son variables dado los valores ingresados en dicha
	//columna, mostrar en la matriz a los valores de las multiplicaciones segun los parametros
	//ingresados en la columna 0
	//tabla de multiplicar del 1 al 9, la columna es variable
	//Una vez ingresado los valores de la tabla a calcular se deberá identificar los multiplos comunes
	// que comparten dos o más números
	Escribir "¿Cual es el número de filas?";
	f<-5;
	Escribir f;
	Escribir "¿Cual es el número de columnas?";
	c<-10;
	Escribir c;
	Dimension matriz[f,c];
	//Se asignan los valores de la columna
	Dimension coincidencias[54];
	Para x<-1 Hasta f-1 Hacer
		Escribir "Escribe el valor de la columna " x;
		Leer matriz[x,0];
	FinPara
	//Se asignan los valores de las filas
	Para z<-1 Hasta c-1 Hacer
		matriz[0,z]<-z;
	FinPara
	Para x<-1 Hasta f-1 Hacer
		Para z<-1 Hasta c-1 Hacer
			//Se multiplica la columna por la fila dentro de toda la tabla
			matriz[x,z]<-matriz[x,0]*matriz[0,z];
		FinPara
	FinPara
	Escribir "   M A T R I Z";
	Escribir " ";
	//Se acomoda la matriz dependiendo de que número sea impreso
	Para x<-0 Hasta f-1 Hacer
		Para z<-0 Hasta c-1 Hacer
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
	Para x<-1 Hasta f-1 Hacer
		Para z<-1 Hasta c-1 Hacer
			Para t<--3 Hasta 3 Hacer
				Si x+t>x y x+t<f Entonces
					multi<-0;
					//Se busca multiplos debajo del número en el que se encuentra buscando
					Si matriz[x,z]=matriz[x+t,z] Entonces
						multi<-multi+1
						Si multi=1 Entonces
							//Se registra la coincidencia
							coincidencias[m]<-matriz[x,z];
							m<-m+1;
						FinSi
					SiNo
						Para s<-1 Hasta c-2 Hacer
							Si z-s>0 Entonces
								//Se busca multiplos debajo y atras del número en el que se encuentra buscando
								Si matriz[x,z]=matriz[x+t,z-s] Entonces
									multi<-multi+1;
									Si multi=1 Entonces
										//Se registra la coincidencia
										coincidencias[m]<-matriz[x,z];
										m<-m+1;
									FinSi
								FinSi
							FinSi
							Si z+s<c Entonces
								//Se busca multiplos debajo y adelante del número en el que se encuentra buscando
								Si matriz[x,z]=matriz[x+t,z+s] Entonces
									multi<-multi+1;
									Si multi=1 Entonces
										//Se registra la coincidencia
										coincidencias[m]<-matriz[x,z];
										m<-m+1;
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
	//Si hay más de 0 multiplos inicia
	Si m>0 Entonces
		Para x<-0 Hasta m-2 Hacer
			Si x>=0 Entonces
				ant<-x;
			FinSi
			Para z<-x+1 Hasta m-1 Hacer
				Si coincidencias[z]<coincidencias[ant] Entonces
					ant<-z;
				FinSi
			FinPara		
			Si x>=0 y coincidencias[x]<>0 y coincidencias[ant]<>0 Entonces
				aux<-coincidencias[x];
				coincidencias[x]<-coincidencias[ant];
				coincidencias[ant]<-aux;
			FinSi
		FinPara
		//Se imprimen los multiplos
		Para t<-0 Hasta m-1 Hacer
			Si t>0 Entonces
				//Entre todas las coincidencias se cerciora de que no se marquen las coincidencias identicas 
				Escribir coincidencias[t]
				Si coincidencias[t]<>coincidencias[t-1] Entonces
					Escribir "Los números con multiplo " , coincidencias[t], " son:"
					Para x<-1 Hasta f-1 Hacer 
						Para z<-1 Hasta c-1 Hacer
							//Se busca si la coincidencia es igual a un número en toda la tabla y se imprime
							Si matriz[x,z]=coincidencias[t] Entonces
								//Se imprime el número de las variables registradas en la primera columna
								Escribir "El número ", matriz[x,0];
							FinSi
						FinPara
					FinPara
				FinSi
			SiNo
				//Si es la primera vez se imprime la primera coincidencia
				Escribir "Los números con multiplo " , coincidencias[t], " son:"
				Para x<-1 Hasta f-1 Hacer 
					Para z<-1 Hasta c-1 Hacer
						//Se busca si la coincidencia es igual a un número en toda la tabla
						Si matriz[x,z]=coincidencias[t] Entonces
							//Se imprime el número de las variables registradas en la primera columna
							Escribir "El número ", matriz[x,0];
						FinSi
					FinPara
				FinPara
			FinSi
		FinPara
	SiNo
		//Si no hay multiplos de imprime un mensaje
		Escribir "No hay números multiplos que coincidan entre 2 o más números";
	FinSi
FinAlgoritmo
