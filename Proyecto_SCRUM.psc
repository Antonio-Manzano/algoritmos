Algoritmo Proyecto_U3
	Definir estudiantes, carreras, grupos, maestros, pagos, becas Como Caracter;
	Definir respuesta, numb, v, carrerae, gsmmei, gc Como Caracter;
	Definir ce, cc, cg, cm, cp, cb, ci, cei, contadoresgrupos, contadoru, gsm como Entero;
	Definir n, x, z, t, u como Entero;
	Definir invalida Como Logico;
	
	Dimension estudiantes[100,7];
	Dimension maestros[100,3];
	Dimension carreras[100];
	Dimension grupos[100,9];
	Dimension contadoresgrupos[100];
	Dimension becas[100];
	Dimension respuesta[6];
	Dimension numb[10];
	Dimension gsmmei[100]; //Vector para saber que posicion grupos no tiene maestros y que estudiantes no están inscritos
	Dimension gc[100]; //Vector para conocer los grupos que coinciden con la carrera de un alumno
	///Escribir en los invalidos verdaderos que elija una opcion correcta
	///Diseñar mejor los menús
	cei<-0; //Contador estudiantes inscritos
	cc<-0; //Contador carreras 
	cg<-0; //Contador grupos 
	cm<-0; //Contador maestros
	cp<-0; //Contador pagos
	cb<-0; //Contador becas
	invalida<-Falso;
	ci<-0; //Contador de cosas mal hechas
	contadoru<-0;
	ce<-0; //Contador aspirantes
	Para x<-0 Hasta 99 Hacer
		Para z<-0 Hasta 8 Hacer
			grupos[x,z]<-""; //Se rellena matriz para verificar espacios vacios
		FinPara
	FinPara
	Para x<-0 Hasta 99 Hacer
		gc[x]<-""; //Se rellena vector para verificar espacios vacios
	FinPara
	Para x<-0 Hasta 99 Hacer
		Para z<-0 hasta 6 Hacer
			estudiantes[x,z]<-""; //Se rellena matriz para verificar espacios vacios
		FinPara
	FinPara
	Para x<-0 Hasta 9 Hacer
		numb[x]<-ConvertirATexto(x); //Se rellena vector con numeros del 0 al 9 para validaciones
	FinPara
	Para x<-0 Hasta 99 Hacer
		contadoresgrupos[x]<-0;
	FinPara
	Repetir
		Escribir "Bienvenido al sistema escolar";
		Escribir "1.-Añadir datos";
		Escribir "2.-Observar datos";
		Escribir "3.-Salir";
		Leer respuesta[0];
		Si respuesta[0]="1" o respuesta[0]="2" Entonces
			Si respuesta[0]="1" Entonces
				Repetir
					Escribir "1.-Añadir carreras";
					Escribir "2.-Añadir maestros";
					Escribir "3.-Añadir grupos";
					Escribir "4.-Añadir aspirantes";
					Escribir "5.-Modificar estado de aspirantes";
					Escribir "6.-Añadir estudiantes a grupos";
					Escribir "7.-Volver al menú principal";
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
								FinPara //Validacion de cantidad numerica para agregar cierta cantidad de carreras
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
								Si carreras[x]="" Entonces //Validacion para que no ingrese espacio vacio
									Escribir "Ingrese algo";
								FinSi
							Hasta Que carreras[x]<>""
							cc<-cc+1;
						FinPara
					SiNo
						Si respuesta[1]="2" Entonces
							Si cg>0 Entonces
								gsm<-0;
								Para x<-0 Hasta cg-1 Hacer
									Para z<-2 Hasta 8 Hacer
										Si grupos[x,z]="" Entonces
											gsm<-1+gsm;
											z<-8; //Cuenta los grupos en los que no hay maestros
										FinSi
									FinPara
								FinPara
								Escribir gsm;
								Si gsm>0 Entonces //Si no hay maestros deja añadir para que al menos tenga un grupo
									Repetir
										Escribir "¿Cual es el nombre del maestro ", cm+1, " ?";
										Leer maestros[cm,0];
										Si maestros[cm,0]="" Entonces
											Escribir "No dejes el nombre de maestro vacio";
											invalida<-Verdadero; //Validacion espacio vacio
										SiNo
											invalida<-Falso;
										FinSi
										Para x<-0 Hasta cg-1 Hacer
											Para z<-2 Hasta 8 Hacer
												Si maestros[cm,0]=grupos[x,z] Entonces
													invalida<-Verdadero; //Comprueba que no existan maestros iguales
													x<-cg-1;
													z<-7;
													Escribir "Ya existe este maestro, ingrese otro";
												SiNo
													invalida<-Falso;
												FinSi
											FinPara
										FinPara
									Hasta Que invalida<>Verdadero
									Escribir "¿Cual es el telefono del maestro ", cm+1, " ?";
									Repetir
										ci<-0;			//Validación para que no marque error si se ingresa caracter, y para que el numero sea de diez digitos
										Leer maestros[cm,1];
										Para x<-0 Hasta Longitud(maestros[cm,1]) Hacer
											Para t<-0 Hasta 9 Hacer
												Si Subcadena(maestros[cm,1],x,x)=numb[t] Entonces
													ci<-1+ci;
													t<-9;
												FinSi 
											FinPara
										FinPara
										Si ci<>Longitud(maestros[cm,1]) Entonces
											Escribir "Error, escriba un numero de telefono de 10 digitos";
										SiNo
											Si Longitud(maestros[cm,1])<>10 Entonces
												Escribir "Error, escriba un número de 10 digitos";
											FinSi
										FinSi
									Hasta Que ci=Longitud(maestros[cm,1]) y Longitud(maestros[cm,1])=10
									ci<-0;
									Escribir "¿Cual es el correo del maestro ", cm+1, " ?";
									Repetir
										ci<-0;
										Leer maestros[cm,2];
										Para x<-0 hasta Longitud(maestros[cm,2]) Hacer
											Si Subcadena(maestros[cm,2],x,x)="@" Entonces
												Si x>=4 Entonces
													ci<-ci+1;
												FinSi
											FinSi
											Si Subcadena(maestros[cm,2],x,x)="." Entonces //Validacion de correo electronico
												Si x>=7 Entonces
													Si ci=1 Entonces
														Si Subcadena(maestros[cm,2],x-1,x-1)<>"@" y Subcadena(maestros[cm,2],x-2,x-2)<>"@"  y Subcadena(maestros[cm,2],x+1,x+1)<>"" Entonces
															ci<-ci+1;
														FinSi
													FinSi
												FinSi
											FinSi
										FinPara
										Si ci<>2 Entonces
											Escribir "Error, escriba adecuadamente el correo electronico (minimo 4 letras antes del @, minimo 3 letras despues del @ un . y minimo una letra después del .)";
										FinSi
									Hasta Que ci=2
									ci<-0;
									Escribir "¿A cuántos grupos asignarás este maestro?";
									Repetir
										Leer v;
										Para x<-0 Hasta longitud(v) Hacer
											Para z<-0 Hasta 9 Hacer
												Si Subcadena(v,x,x)=numb[z] Entonces
													ci<-1+ci;
												FinSi
											FinPara
										FinPara								//Validacion de cantidad numerica de añadido de grupos
										Si ci<>longitud(v) o v="" Entonces
											Escribir "Ingrese una cantidad numerica";
											invalida<-Verdadero;
										SiNo
											invalida<-Falso;
											Si ConvertirANumero(v)<=0 Entonces
												Escribir "Error, ingrese una cantidad mayor a 0"; //Validacion mayor a 0
												invalida<-Verdadero;
											FinSi
										FinSi
										Si gsm<ConvertirANumero(v) Entonces
											Escribir "Error, actualmente solo hay ", gsm, " grupos sin maestro";
											invalida<-Verdadero; //Si hay menos grupos sin maestro que grupos en los que se asigna pide volver a ingresar la cantidad de grupos
										FinSi
										ci<-0;
									Hasta Que invalida<>Verdadero
									Para u<-0 Hasta ConvertirANumero(v)-1 Hacer
										Escribir "--Asigne-el-maestro-a-un grupo--";
										Escribir "---Grupos con vacante de maestro---";
										Para x<-0 Hasta cg-1 Hacer
											Para z<-2 Hasta 8 Hacer
												Si grupos[x,z]="" Entonces
													ci<-1+ci;    
												FinSi			//Cuenta si tiene espacios vacios y los añade en un listado
											FinPara
											Para z<-2 Hasta 8 Hacer
												Si grupos[x,z]=maestros[cm,0] Entonces
													ci<-0;
												FinSi
											FinPara
											Si ci>0 Entonces
												Escribir x+1, ". ", grupos[x,0], " ", grupos[x,1]; //Se muestra un listado de los grupos sin maestros llenos
												gsmmei[x]<-ConvertirATexto(x+1);
											FinSi
										FinPara
										Repetir
											Repetir 
												Leer respuesta[3];
												Si respuesta[3]="" Entonces
													Escribir "Error, ingresa algo";
												FinSi
											Hasta Que respuesta[3]<>"";
											Para x<-0 Hasta cg-1 Hacer
												Si respuesta[3]=gsmmei[x] Entonces
													invalida<-Falso; //Se confirma que la eleccion hecha es de un grupo mostrado en el listado
													x<-gsm-1;
												SiNo
													invalida<-Verdadero;
												FinSi
											FinPara
											Si invalida<>Verdadero Entonces
												Para z<-0 Hasta cg-1 Hacer
													Si (ConvertirANumero(respuesta[3])-1)=z Entonces
														invalida<-Falso;
														Para t<-2 Hasta 8 Hacer
															Si grupos[z,t]="" Entonces
																grupos[z,t]<-maestros[cm,0]; //validacion para añadir al maestro
																t<-8;
															FinSi
														FinPara
														z<-cg-1;
													SiNo
														invalida<-Verdadero;
													FinSi
												FinPara
												Si invalida=Verdadero Entonces
													Escribir "Error, elija una opcion valida";
												FinSi
											SiNo
												Escribir "Error, elija una opcion valida";
											FinSi
										Hasta Que invalida<>Verdadero;
										ci<-0;
										Para x<-0 Hasta cg-1 Hacer
											gsmmei[x]<-"";
										FinPara //Se borra el listado para que se genere uno nuevo cada que se ingrese a el
									FinPara
									cm<-cm+1;
								SiNo
									Escribir "Añade más grupos, todos los grupos actuales cuentan con sus 7 maestros correspondientes";
								FinSi
							SiNo
								Escribir "Tiene que haber grupos disponibles para añadir maestros";
							FinSi
						SiNo
							Si respuesta[1]="3" Entonces
								Si cc>0 Entonces
									Escribir "¿A que carrera desea añadir grupos?";
									Para x<-0 Hasta cc-1 Hacer
										Escribir x+1,". ", carreras[x];
									FinPara 								//Muestra un listaod de los grupos
									Repetir
										Leer v;
										Para x<-0 Hasta longitud(v) Hacer
											Para z<-0 Hasta 9 Hacer
												Si Subcadena(v,x,x)=numb[z] Entonces //validacion de que sea una cantidad numerica
													ci<-1+ci;
												FinSi
											FinPara
										FinPara
										Si ci<>longitud(v) o v="" Entonces
											Escribir "Ingrese un numero de eleccion";
											invalida<-Verdadero;
										SiNo
											invalida<-Falso;
											Si ConvertirANumero(v)<=0 o ConvertirANumero(v)>cc Entonces
												Escribir "Error, ingrese un numero valido"; //validacion de que sea una carrera de la lista
												invalida<-Verdadero;
											SiNo
												respuesta[3]<-v;
											FinSi
										FinSi
										ci<-0;
									Hasta Que invalida<>Verdadero
									Para z<-0 Hasta cc-1 Hacer
										Si respuesta[3]=ConvertirATexto(z+1) Entonces
											carrerae<-carreras[z];
											contadoru<-z;
											z<-cc;		//Se confirma cual es el grupo
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
										FinPara												//Se confirma que sea una cantidad numerica
										Si ci<>longitud(v) o v="" Entonces
											Escribir "Ingrese una cantidad numerica";
											invalida<-Verdadero;
										SiNo
											invalida<-Falso;
											Si ConvertirANumero(v)<=0 Entonces
												Escribir "Error, ingrese una cantidad mayor a 0";
												invalida<-Verdadero; 			//Se confirma que sea mayor a 0
											FinSi
										FinSi
										ci<-0;
									Hasta Que invalida<>Verdadero
									n<-ConvertirANumero(v);
									Para x<-0 Hasta n-1 Hacer
										grupos[cg,0]<-Concatenar("Grupo ",ConvertirATexto(contadoresgrupos[contadoru]+1));
										grupos[cg,1]<-carrerae;
										contadoresgrupos[contadoru]<-1+contadoresgrupos[contadoru];
										cg<-1+cg;		//Se añaden esos grupos a una matriz junto con su carrera
									FinPara
								SiNo
									Escribir "No hay carreras a las cuales añadir grupos";
								FinSi
							SiNo
								Si respuesta[1]="4" Entonces
									Si cc>0 Entonces
										Escribir "¿Cuantos estudiantes agregaras?";
										Repetir
											Leer v;
											Para x<-0 Hasta longitud(v) Hacer
												Para z<-0 Hasta 9 Hacer
													Si Subcadena(v,x,x)=numb[z] Entonces
														ci<-1+ci;
													FinSi											//Confirma si es numerica la respuesta
												FinPara
											FinPara
											Si ci<>longitud(v) o v="" Entonces
												Escribir "Ingrese una cantidad numerica";
												invalida<-Verdadero;
											SiNo
												invalida<-Falso;							//Confirma si es mayor a 0
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
											Repetir 
												Escribir "¿Cual es el nombre del estudiante ", ce+1, " ?";
												Leer estudiantes[ce,1];
												Si estudiantes[ce,1]="" Entonces
													Escribir "Escriba algo";		//validacion espacio vacio
												FinSi
											Hasta Que estudiantes[ce,1]<>""
											Escribir "¿Cual es el telefono del estudiante ", ce+1, " ?";
											Repetir
												ci<-0;			//Validación para que no marque error si se ingresa caracter, y para que el numero sea de diez digitos
												Leer estudiantes[ce,2];
												Para x<-0 Hasta Longitud(estudiantes[ce,2]) Hacer
													Para t<-0 Hasta 9 Hacer
														Si Subcadena(estudiantes[ce,2],x,x)=numb[t] Entonces
															ci<-1+ci;
															t<-9;
														FinSi
													FinPara
												FinPara
												Si ci<>Longitud(estudiantes[ce,2]) Entonces
													Escribir "Error, escriba un numero de telefono de 10 digitos";
												SiNo
													Si Longitud(estudiantes[ce,2])<>10 Entonces
														Escribir "Error, escriba un número de 10 digitos";
													FinSi
												FinSi
											Hasta Que ci=Longitud(estudiantes[ce,2]) y Longitud(estudiantes[ce,2])=10
											ci<-0;
											Repetir
											Escribir "¿Cual es el correo del estudiante ", ce+1, " ?";
												ci<-0;
												Leer estudiantes[ce,3];
												Para x<-0 hasta Longitud(estudiantes[ce,3]) Hacer
													Si Subcadena(estudiantes[ce,2],x,x)="@" Entonces
														Si x>=4 Entonces
															ci<-ci+1;		//validacion de correo electronico
														FinSi
													FinSi
													Si Subcadena(estudiantes[ce,3],x,x)="." Entonces
														Si x>=7 Entonces
															Si ci=1 Entonces
																Si Subcadena(estudiantes[ce,3],x-1,x-1)<>"@" y Subcadena(estudiantes[ce,3],x-2,x-2)<>"@"  y Subcadena(estudiantes[ce,3],x+1,x+1)<>"" Entonces
																	ci<-ci+1;
																FinSi
															FinSi
														FinSi
													FinSi
												FinPara
												Si ci<>2 Entonces
													Escribir "Error, escriba adecuadamente el correo electronico (minimo 4 letras antes del @, minimo 2 letras despues del @ un . y minimo una letra después del .)";
												FinSi
											Hasta Que ci=2
											ci<-0;
											Repetir
												Escribir "¿A cuál carrea desea ingresar el estudiante ", ce+1, "?";
												Para z<-0 Hasta cc-1 Hacer
													Escribir z+1, ".", carreras[z];
												FinPara
												Repetir														//Muestra el listado de carreras
													Leer respuesta[3];
													Para z<-0 Hasta cc-1 Hacer
														Si respuesta[3]=ConvertirATexto(z+1) Entonces
															invalida<-Falso;						//verifica que la carrera exista y se añade al estudiante
															estudiantes[ce,4]<-carreras[z];
															z<-cc-1;
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
												Escribir "¿Está realizando el pago el estudiante ", ce+1,"?";
												Escribir "1. Sí";
												Escribir "2. No";
												Leer respuesta[3];
												Si respuesta[3]="1" Entonces
													estudiantes[ce,5]<-"Pagado";
													invalida<-Falso;
													cei<-cei+1;
												SiNo										//Pregunta por el pago y se le asigna si lo hace o no
													Si respuesta[3]="2" Entonces
														estudiantes[ce,5]<-"No pagado";
														invalida<-Falso;
													SiNo
														Escribir "Elija una opcion valida";
														invalida<-Verdadero;
													FinSi
												FinSi
											Hasta Que invalida<>Verdadero;
											Si estudiantes[ce,5]="No pagado" Entonces
												Repetir
													Escribir "¿El estudiante ", ce+1, " posee la beca Jovenes Universitarios?";
													Escribir "1. Sí";
													Escribir "2. No";
													Leer respuesta[3];
													Si respuesta[3]="1" Entonces
														estudiantes[ce,5]<-"Becado";
														invalida<-Falso;						//Si no pago, se le pregunta si le fue otorgada una beca
														cei<-cei+1;
													SiNo
														Si respuesta[3]<>"2" Entonces
															Escribir "Elija una opcion valida";
															invalida<-Verdadero;
														FinSi
													FinSi				//Sino, se queda en no pagado y luego se puede pagar
												Hasta Que invalida<>Verdadero
											FinSi
											ce<-1+ce;
										FinPara
									SiNo
										Escribir "No hay carreras a las cuales ingresar estudiantes";
									FinSi
								SiNo
									Si respuesta[1]="5" Entonces
										Si ce-cei>0 Entonces
											Para x<-0 Hasta ce-1 Hacer
												Si estudiantes[x,5]="No pagado" Entonces
													Para z<-0 Hasta 6 Hacer
														Si z=0 Entonces
															Escribir Sin Saltar estudiantes[x,z], ". ";
														SiNo
															Escribir Sin Saltar estudiantes[x,z], "|";
														FinSi
													FinPara
													Escribir "";
													gsmmei[x]<-ConvertirATexto(x+1);			//Muestra un listado de alumnos que no pagaron
												FinSi
											FinPara
											Repetir														
											Leer respuesta[3];
												Para x<-0 Hasta ce-1 Hacer
													Si gsmmei[x]=respuesta[3] Entonces		//confirma que la eleccion sea un alumno que no ha pagado
														invalida<-Falso;
														ci<-ci+1;
														Repetir
															Escribir "¿De qué manera quiere cambiar el estado de el alumno con matrícula ", respuesta[3],"?";
															Escribir "1. Pagar inscripción";
															Escribir "2. Aplicar beca";
															Escribir "3. Salir";
															Leer respuesta[4];
															Si respuesta[4]="1" Entonces
																estudiantes[ConvertirANumero(gsmmei[x])-1,5]<-"Pagado";
																invalida<-Falso;
															SiNo													//Se cambia a pagado o a no becado o sale
																Si respuesta[4]="2" Entonces
																	estudiantes[ConvertirANumero(gsmmei[x])-1,5]<-"Becado";
																	invalida<-Falso;
																SiNo
																	Si respuesta[4]<>"3" Entonces
																		Escribir "Error, elija una opcion valida";
																		invalida<-Verdadero;
																	FinSi
																FinSi
															FinSi
														Hasta Que invalida<>Verdadero
														Para t<-0 Hasta ce-1 Hacer
															gsmmei[t]<-""; //Se vacia el vector para un proximo chequeo
														FinPara
														x<-ce-1;
													SiNo
														Si ci=0 y ce-1=x Entonces
															Escribir "Error, elija una opción valida";
															invalida<-Verdadero;
														FinSi
													FinSi
												FinPara
												ci<-0;
											Hasta Que invalida<>Verdadero
										SiNo
											Si cei>0 Entonces
												Escribir "Todos los aspirantes se encuentran inscritos";
											SiNo
												Escribir "No hay aspirantes disponibles";
											FinSi
										FinSi
									SiNo
										Si respuesta[1]="6" Entonces
											Si cei>0 y cg>0 Entonces
												Escribir "¿A qué estudiante desea ingresar a un grupo?";		//Muestra un listado de alumnos pagados y becados
												Para x<-0 Hasta ce-1 Hacer
													Si (estudiantes[x,6]="" y estudiantes[x,5]="Pagado") o (estudiantes[x,6]="" y estudiantes[x,5]="Becado")Entonces
														Escribir estudiantes[x,0],"|", estudiantes[x,1], "|", estudiantes[x,5], "|";
														gsmmei[x]<-ConvertirATexto(x+1);
													FinSi
												FinPara
												Repetir
													Leer respuesta[3];
													Para x<-0 Hasta ce-1 Hacer
														Si respuesta[3]=gsmmei[x] Entonces
															Escribir "¿A qué grupo desea ingresarlo? (De su carrera)";
															Para t<-0 Hasta cg-1 Hacer	//Se confirma que es del listado y se ingresa a un grupo
																Si estudiantes[ConvertirANumero(respuesta[3])-1,4]=grupos[t,1] Entonces
																	Escribir t+1, ". ", grupos[t,0], "|", grupos[t,1];
																	gc[t]<-ConvertirATexto(t+1);
																FinSi
															FinPara
															invalida<-Falso;
															ci<-ci+1;
														SiNo
															Si ci=0 y ce-1=x Entonces
																Escribir "Ingrese una opcion valida";
																invalida<-Verdadero;
															FinSi
														FinSi
													FinPara
													ci<-0;
												Hasta Que invalida<>Verdadero
												Repetir
													Leer respuesta[4];
													Para u<-0 hasta ce-1 Hacer				//Se le añade al grupo
														Si respuesta[4]=gc[u] Entonces
															invalida<-Falso;
															estudiantes[ConvertirANumero(respuesta[3])-1,6]<-grupos[ConvertirANumero(respuesta[3])-1,0];
															ci<-ci+1;
														SiNo
															Si ci=0 y u=ce-1 Entonces
																Escribir "Ingrese una opcion valida";
																invalida<-Verdadero;
															FinSi
														FinSi
													FinPara
													ci<-0;
												Hasta Que invalida<>Verdadero
												Para x<-0 hasta cg-1 Hacer
													gc[x]<-"";			//Se vacian los vectores
													gsmmei[x]<-"";
												FinPara
											SiNo
												Si cg=0 Entonces
													Escribir "No hay grupos existentes aún";
												SiNo
													Escribir "No hay estudiantes aún";		//Si no hay grupos o estudiantes no realiza nada
												FinSi
											FinSi
										SiNo
											Si respuesta[1]<>"7" Entonces
												Escribir "Error, elija una opcion valida";
											FinSi
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				Hasta Que respuesta[1]="7";
			SiNo
				Si respuesta[0]="2" Entonces
					Repetir
						Escribir "1.-Carreras";
						Escribir "2.-Estudiantes Ingresados";
						Escribir "3.-Grupos";
						Escribir "4.-Maestros";
						Escribir "5.-Pagos/Becas Aspirantes";
						Escribir "6.-Volver al menú principal";
						Leer respuesta[2];
						Si respuesta[2]="1" Entonces
							Escribir "--Lista de carreras--";
							Para x<-0 Hasta cc-1 Hacer
								Escribir x+1, ". ", carreras[x];
							FinPara
							Escribir "--------------------";
						SiNo
							Si respuesta[2]="2" Entonces
								Si cei>0 Entonces
									Para x<-0 Hasta ce-1 Hacer //Muestra de estudiantes ingresados
										Si estudiantes[x,5]="Pagado" o estudiantes[x,5]="Becado" Entonces
											Para z<-0 Hasta 6 Hacer
												Si z>0 Entonces
													Escribir Sin Saltar "", estudiantes[x,z], "|";
												SiNo
													Escribir Sin Saltar "|", estudiantes[x,z], "|";
												FinSi
											FinPara
											Escribir "";
										FinSi
									FinPara
								SiNo
									Escribir "Actualmente no hay estudiantes inscritos";
								FinSi
							SiNo
								Si respuesta[2]="3" Entonces
									Si cg>0 Entonces
										Escribir "1. Mostrar grupos existentes";
										Escribir "2. Mostrar listas de alumnado en grupos";
										Repetir
											Leer respuesta[5];
											Si respuesta[5]="1"  		//muestra toda la matriz de grupos
												Si cg>0 Entonces
													Escribir "----GRUPOS--EXISTENTES----";
													Para x<-0 Hasta cg-1 Hacer
														Escribir grupos[x,0], " ", grupos[x,1]; //Se muestran los grupos con su correspondiente maestro
													FinPara
													invalida<-Falso;
												SiNo
													Escribir "No hay grupos que mostrar";
												FinSi
												Escribir "-------------------------";
											SiNo
												Si respuesta[5]="2" Entonces
													Si cg>0 Entonces
														Escribir "¿De qué grupo desea ver la lista de alumnos?";
														Para x<-0 Hasta cg-1 Hacer
															Escribir x+1, ". ", grupos[x,0], "|", grupos[x,1];
															gsmmei[x]<-ConvertirATexto(x+1);		//muestra un litado de los grupos existentes
														FinPara
														Repetir
															Leer respuesta[4];
															Para z<-0 Hasta cg-1 Hacer
																Si ConvertirANumero(gsmmei[z])=ConvertirANumero(respuesta[4]) Entonces
																	ci<-0;
																	Para z<-2 Hasta 8 Hacer
																		Si grupos[ConvertirANumero(respuesta[4])-1,z]<>"" Entonces
																			ci<-1+ci;
																		FinSi
																	FinPara
																	Si ci>0 Entonces
																		//Se muestran los maestros y los estudiantes
																			Para x<-0 Hasta ci-1 Hacer	//muestra los maestros
																				Escribir "Maestros:", grupos[ConvertirANumero(respuesta[4])-1,x], " ";
																			FinPara
																			Para t<-0 Hasta ce-1 Hacer
																				Si grupos[ConvertirANumero(respuesta[4])-1,0]=estudiantes[t,6] y estudiantes[t,4]=grupos[ConvertirANumero(respuesta[4])-1,1] Entonces
																					Para u<-0 Hasta 6 Hacer
																						Si u>0 Entonces
																							Escribir Sin Saltar "", estudiantes[t,u], "|";
																						SiNo
																							Escribir Sin Saltar "|", estudiantes[t,u], "|";
																						FinSi
																					FinPara
																					Escribir "";
																					invalida<-Falso;
																					ci<-ci+1;
																				FinSi
																			FinPara
																		invalida<-Falso;
																		z<-cg-1;
																		Si ci=0 y cg-1=z Entonces
																			Escribir "No hay estudiantes en este grupo";
																		FinSi
																	SiNo			//Validacion de maestros y estudiantes
																		Escribir "No hay maestros en el grupo ", grupos[ConvertirANumero(respuesta[4])-1,z]," añada alguno antes de checar el grupo";
																		invalida<-Falso;
																	FinSi
																SiNo
																	invalida<-Verdadero; 
																FinSi
																Si invalida=Verdadero y z=cg-1 Entonces
																	Escribir "Error, ingrese una opcion valida";
																FinSi
																ci<-0;
															FinPara
														Hasta Que invalida<>Verdadero
														Para x<-0 Hasta cg-1 Hacer
															gsmmei[x]<-""; //Se vacian los vectores para una proxima revisada
														FinPara
													SiNo
														invalida<-Falso;
														Escribir "No hay grupos que mostrar";
													FinSi
												SiNo
													Escribir "Elija una opcion valida";
													invalida<-Verdadero;
												FinSi
											FinSi
										Hasta Que invalida<>Verdadero
									SiNo
										Escribir "No hay grupos que mostrar";
									FinSi
								SiNo
									Si respuesta[2]="4" Entonces
										Si cm>0 Entonces
											Para x<-0 Hasta cm-1 Hacer
												Para z<-0 Hasta 2 Hacer
													Escribir Sin Saltar maestros[x,z], "| ";
												FinPara
												Para t<-0 Hasta cg-1 Hacer
													Para u<-2 Hasta 8 Hacer
														Si maestros[x,0]=grupos[t,u] Entonces			//Se muestran los maestros y los grupos a los que pertenece
															Escribir Sin Saltar grupos[t,0], " | ";
														FinSi
													FinPara
												FinPara
												Escribir "";
											FinPara
										SiNo
											Escribir "No se han ingresado maestros";
										FinSi
									SiNo
										Si respuesta[2]="5" Entonces
											Si ce-cei>0 Entonces
												Para x<-0 Hasta cei-1 Hacer
													Si estudiantes[x,5]="No pagado" Entonces
														Para z<-0 Hasta 6 Hacer
															Si z>0 Entonces
																Escribir Sin Saltar "", estudiantes[x,z], "|";
															SiNo
																Escribir Sin Saltar "|", estudiantes[x,z], "|";
															FinSi
														FinPara
														Escribir "";
													FinSi
												FinPara //Se muestran los estudiantes pendientes de pago
											SiNo
												Si cei>0 Entonces
													Escribir "Todos los estudiantes se encuentran inscritos";
												SiNo
													Escribir "No hay aspirantes registrados";
												FinSi
											FinSi
										SiNo
											Si respuesta[2]<>"6" Entonces
												Escribir "Elige una opción válida";
											FinSi
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					Hasta Que respuesta[2]="6";
				FinSi
			FinSi
		SiNo
			Escribir "Elige una opción válida";
		FinSi
	Hasta Que respuesta[0]="3";
FinAlgoritmo
