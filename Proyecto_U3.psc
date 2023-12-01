Algoritmo Proyecto_U3
	Definir estudiantes, carreras, grupos, maestros, pagos, becas Como Caracter;
	Definir respuesta, numb, v, carrerae Como Caracter;
	Definir ce, cc, cg, cm, cp, cb, ci, contadoresgrupos, contadoru como Entero;
	Definir n, x, z, t, u como Entero;
	Definir invalida Como Logico;
	
	Dimension estudiantes[100,6];
	Dimension maestros[100,3];
	Dimension carreras[100];
	Dimension grupos[100,3];
	Dimension contadoresgrupos[100];
	Dimension becas[100];
	Dimension respuesta[6];
	Dimension numb[10];
	ce<-0; //Contador estudiantes
	cc<-0; //Contador carreras 
	cg<-0; //Contador grupos 
	cm<-0; //Contador maestros
	cp<-0; //Contador pagos
	cb<-0; //Contador becas
	invalida<-Falso;
	ci<-0; //Contador de cosas mal hechas
	contadoru<-0;
	Para x<-0 Hasta 9 Hacer
		numb[x]<-ConvertirATexto(x);
	FinPara
	Para x<-0 Hasta 99 Hacer
		contadoresgrupos[x]<-0;
	FinPara
	Repetir
		Escribir "1.-Añadir datos";
		Escribir "2.-Observar datos";
		Escribir "3.-Salir";
		Leer respuesta[0];
		Si respuesta[0]="1" o respuesta[0]="2" Entonces
			Si respuesta[0]="1" Entonces
				Repetir
					Escribir "1.-Carreras";
					Escribir "2.-Maestros";
					Escribir "3.-Grupos";
					Escribir "4.-Becas";
					Escribir "5.-Estudiantes";
					Escribir "6.-Volver al menú principal";
					Leer respuesta[1];
					Si respuesta[1]="1" Entonces
						Escribir "¿Cuantas carreras agregaras?";
						Repetir
							Leer v;
							Para x<-0 Hasta longitud(v) Hacer
								Para z<-0 Hasta 9 Hacer
									Si Subcadena(v,x,x)=numb[z] Entonces
										ci<-1+ci;
									FinSi
								FinPara
							FinPara
							Si ci<>longitud(v) o v="" Entonces
								Escribir "Ingrese una cantidad numerica";
								invalida<-Verdadero;
							SiNo
								invalida<-Falso;
								Si ConvertirANumero(v)<=0 Entonces
									Escribir "Error, ingrese una cantidad mayor a 0";
									invalida<-Verdadero;
								FinSi
							FinSi
							ci<-0;
						Hasta Que invalida<>Verdadero
						n<-ConvertirANumero(v);
						Para x<-0 Hasta n-1 Hacer
							Repetir
								Escribir "Ingresa la carrera ", cc+1;
								Leer carreras[x];
								Si carreras[x]="" Entonces
									Escribir "Ingrese algo";
								FinSi
							Hasta Que carreras[x]<>""
							cc<-cc+1;
						FinPara
					SiNo
						Si respuesta[1]="2" Entonces
							Escribir "¿Cuantos maestros agregaras?";
							Repetir
							 	Leer v;
								Para x<-0 Hasta longitud(v) Hacer
									Para z<-0 Hasta 9 Hacer
										Si Subcadena(v,x,x)=numb[z] Entonces
											ci<-1+ci;
										FinSi
									FinPara
								FinPara
								Si ci<>longitud(v) o v="" Entonces
									Escribir "Ingrese una cantidad numerica";
									invalida<-Verdadero;
								SiNo
									invalida<-Falso;
									Si ConvertirANumero(v)<=0 Entonces
										Escribir "Error, ingrese una cantidad mayor a 0";
										invalida<-Verdadero;
									FinSi
								FinSi
								ci<-0;
							Hasta Que invalida<>Verdadero
							n<-ConvertirANumero(v);
							Para x<-0 Hasta n-1 Hacer
								Escribir "¿Cual es el nombre del maestro ", cm+1, " ?";
								Leer maestros[cm,0];
								Escribir "¿Cual es el telefono del maestro ", cm+1, " ?";
								Leer maestros[cm,1];
								Escribir "¿Cual es el correo del maestro ", cm+1, " ?";
								Leer maestros[cm,2];
								cm<-cm+1;
							FinPara
						SiNo
							Si respuesta[1]="3" Entonces
								Si cc>0 y cm>0 Entonces
									Escribir "¿A que carrera desea añadir grupos?";
									Para x<-0 Hasta cc-1 Hacer
										Escribir x+1,". ", carreras[x];
									FinPara
									Repetir
										Leer v;
										Para x<-0 Hasta longitud(v) Hacer
											Para z<-0 Hasta 9 Hacer
												Si Subcadena(v,x,x)=numb[z] Entonces
													ci<-1+ci;
												FinSi
											FinPara
										FinPara
										Si ci<>longitud(v) o v="" Entonces
											Escribir "Ingrese una cantidad numerica";
											invalida<-Verdadero;
										SiNo
											invalida<-Falso;
											Si ConvertirANumero(v)<=0 o ConvertirANumero(v)<=cc Entonces
												Escribir "Error, ingrese una cantidad mayor a 0";
												invalida<-Verdadero;
											SiNo
												respuesta[3]<-ConvertirANumero(v);
											FinSi
										FinSi
										ci<-0;
									Hasta Que invalida<>Verdadero
									Para z<-1 Hasta cc Hacer
										Si respuesta[3]=ConvertirATexto(z) Entonces
											carrerae<-carreras[z-1];
											contadoru<-z-1;
											z<-cc;
										FinSi
									FinPara
									Escribir "¿Cuantos grupos desea añadir a esa carrera?";
									Repetir
										Leer v;
										Para x<-0 Hasta longitud(v) Hacer
											Para z<-0 Hasta 9 Hacer
												Si Subcadena(v,x,x)=numb[z] Entonces
													ci<-1+ci;
												FinSi
											FinPara
										FinPara
										Si ci<>longitud(v) o v="" Entonces
											Escribir "Ingrese una cantidad numerica";
											invalida<-Verdadero;
										SiNo
											invalida<-Falso;
											Si ConvertirANumero(v)<=0 Entonces
												Escribir "Error, ingrese una cantidad mayor a 0";
												invalida<-Verdadero;
											FinSi
										FinSi
										ci<-0;
									Hasta Que invalida<>Verdadero
									n<-ConvertirANumero(v);
									Para x<-0 Hasta n-1 Hacer
										grupos[cg,0]<-Concatenar("Grupo ",ConvertirATexto(contadoresgrupos[contadoru]+1));
										grupos[cg,1]<-carrerae;
										Escribir "¿Que maestro estara asignado al ", grupos[cg,0], " de la carrera ", grupos[cg,1]," ? ";
										Para z<-0 Hasta cm-1 Hacer
											Escribir z, ". ", maestros[z,0];
										FinPara
										Repetir
											Leer v;
											Para x<-0 Hasta longitud(v) Hacer
												Para z<-0 Hasta 9 Hacer
													Si Subcadena(v,x,x)=numb[z] Entonces
														ci<-1+ci;
													FinSi
												FinPara
											FinPara
											Si ci<>longitud(v) o v="" Entonces
												Escribir "Ingrese una cantidad numerica";
												invalida<-Verdadero;
											SiNo
												invalida<-Falso;
												Si ConvertirANumero(v)<=0 o ConvertirANumero(v)<=cm Entonces
													Escribir "Error, ingrese una cantidad mayor a 0";
													invalida<-Verdadero;
												SiNo
													respuesta[4]<-ConvertirANumero(v);
												FinSi
											FinSi
											ci<-0;
										Hasta Que invalida<>Verdadero
										Para z<-1 Hasta cm Hacer
											Si respuesta[4]=ConvertirATexto(z) Entonces
												grupos[cg,2]<-maestros[z-1,0];
												z<-cm;
											FinSi
										FinPara
										contadoresgrupos[contadoru]<-1+contadoresgrupos[contadoru];
										cg<-1+cg;
									FinPara
								SiNo
									Escribir "No hay carreras a las cuales añadir grupos";
								FinSi
							SiNo
								Si respuesta[1]="4" Entonces
								SiNo
									Si respuesta[1]="5" Entonces
										Si cc>0 Entonces
											Escribir "¿Cuantos estudiantes agregaras?";
											Repetir
												Leer v;
												Para x<-0 Hasta longitud(v) Hacer
													Para z<-0 Hasta 9 Hacer
														Si Subcadena(v,x,x)=numb[z] Entonces
															ci<-1+ci;
														FinSi
													FinPara
												FinPara
												Si ci<>longitud(v) o v="" Entonces
													Escribir "Ingrese una cantidad numerica";
													invalida<-Verdadero;
												SiNo
													invalida<-Falso;
													Si ConvertirANumero(v)<=0 Entonces
														Escribir "Error, ingrese una cantidad mayor a 0";
														invalida<-Verdadero;
													FinSi
												FinSi
												ci<-0;
											Hasta Que invalida<>Verdadero
											n<-ConvertirANumero(v);
											Para x<-0 Hasta n-1 Hacer
												estudiantes[ce,0]<-ConvertirATexto(ce+1);
												Escribir "¿Cual es el nombre del estudiante ", ce+1, " ?";
												Leer estudiantes[ce,1];
												Escribir "¿Cual es el telefono del estudiante ", ce+1, " ?";
												Leer estudiantes[ce,2];
												Escribir "¿Cual es el correo del estudiante ", ce+1, " ?";
												Leer estudiantes[ce,3];
												Repetir
													Escribir "¿A cuál carrea desea ingresar el estudiante ", ce+1, "?";
													Para z<-0 Hasta cc-1 Hacer
														Escribir z+1, ".", carreras[z];
													FinPara
													Repetir
														Leer respuesta[3];
														Para z<-1 Hasta cc Hacer
															Si respuesta[3]=ConvertirATexto(z) Entonces
																invalida<-Falso;
																estudiantes[ce,4]<-carreras[z-1];
																z<-cc;
															SiNo
																invalida<-Verdadero;
															FinSi
														FinPara
														Si invalida=Verdadero Entonces
															Escribir "Error, elija una opcion valida";
														FinSi
													Hasta Que invalida<>Verdadero;
												Hasta Que estudiantes[ce,4]<>"";
												Repetir
													Escribir "¿Está realizando el pago", ce+1,"?";
													Escribir "1. Sí";
													Escribir "2. No";
													Leer respuesta[3];
													Si respuesta[3]="1" Entonces
														estudiantes[ce,5]<-"Pagado";
														invalida<-Falso;
													SiNo
														Si respuesta[3]="2" Entonces
															estudiantes[ce,5]<-"No pagado";
															invalida<-Falso;
														SiNo
															invalida<-Verdadero;
														FinSi
													FinSi
												Hasta Que invalida<>Verdadero;
												Si estudiantes[ce,5]="No pagado" Entonces
													Repetir
														Escribir "¿El estudiante ", ce+1, " posee la beca Jovenes del Pasado?";
														Escribir "1. Sí";
														Escribir "2. No";
														Leer respuesta[3];
														Si respuesta[3]="1" Entonces
															estudiantes[ce,5]<-"Becado";
															invalida<-Falso;
														SiNo
															Si respuesta[3]<>"2" Entonces
																Escribir "Elija una opcion valida";
																invalida<-Verdadero;
															FinSi
														FinSi
													Hasta Que invalida<>Verdadero
												FinSi
												ce<-1+ce;
											FinPara
										SiNo
											Escribir "No hay carreras a las cuales ingresar estudiantes";
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				Hasta Que respuesta[1]="6";
			SiNo
				Si respuesta[0]="2" Entonces
					Repetir
						Escribir "1.-Estudiantes";
						Escribir "2.-Carreras";
						Escribir "3.-Grupos";
						Escribir "4.-Maestros";
						Escribir "5.-Pagos";
						Escribir "6.-Becas";
						Escribir "7.-Volver al menú principal";
						Leer respuesta[2];
						Si respuesta[2]="1" Entonces
							Escribir "Estudiantes";
						SiNo
							Si respuesta[2]="2" Entonces
								Escribir "Carreras";
							SiNo
								Si respuesta[2]="3" Entonces
									Escribir "1. Mostrar grupos existentes";
									Escribir "2. Mostrar listas de alumnado en grupos";
									Repetir
										Leer respuesta[5];
										Si respuesta[5]="1" Entonces
											Si cg>0 Entonces
												Escribir "----GRUPOS--EXISTENTES----";
												Para x<-0 Hasta cg-1 Hacer
													Escribir grupos[x,0], " ", grupos[x,1]; //Se muestran los grupos con su correspondiente maestro
												FinPara
												invalida<-Falso;
											SiNo
												Escribir "No hay grupos que mostrar";
											FinSi
										SiNo
											Si respuesta[5]="2" Entonces
												invalida<-Falso;
											SiNo
												invalida<-Verdadero;
											FinSi
										FinSi
									Hasta Que invalida<>Verdadero
								SiNo
									Si respuesta[2]="4" Entonces
										Escribir "Maestros";
									SiNo
										Si respuesta[2]="5" Entonces
											Escribir "Pagos";
										SiNo
											Si respuesta[2]="6" Entonces
												Escribir "Becas";
											SiNo
												Si respuesta[2]<>"7" Entonces
													Escribir "Elige una opción válida";
												FinSi
											FinSi
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					Hasta Que respuesta[2]="7";
				Sino
					Si respuesta[0]<>"2" Entonces
						Escribir "Elige una opción válida";
					FinSi
				FinSi
			FinSi
		FinSi
	Hasta Que respuesta[0]="3";
FinAlgoritmo
