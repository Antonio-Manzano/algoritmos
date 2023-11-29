Algoritmo Proyecto_U3
	Definir estudiantes, carreras, grupos, maestros, pagos, becas Como Caracter;
	Definir respuesta Como Caracter;
	
	Dimension estudiantes[100,6];
	Dimension maestros[100,4];
	Dimension carreras[100];
	Dimension grupos[100];
	Dimension becas[100];
	
	Dimension respuesta[3];
	Repetir
		Escribir "1.-Añadir datos";
		Escribir "2.-Observar datos";
		Escribir "3.-Salir";
		Leer respuesta[0];
		Si respuesta[0]="1" o respuesta[0]="2" Entonces
			Si respuesta[0]="1" Entonces
				Repetir
					Escribir "1.-Estudiantes";
					Escribir "2.-Carreras";
					Escribir "3.-Grupos";
					Escribir "4.-Maestros";
					Escribir "5.-Pagos";
					Escribir "6.-Becas";
					Escribir "7.-Volver al menú principal";
					Leer respuesta[1];
					Si respuesta[1]="1" Entonces
						Escribir "Estudiantes";
					SiNo
						Si respuesta[1]="2" Entonces
							Escribir "Carreras";
						SiNo
							Si respuesta[1]="3" Entonces
								Escribir "Grupos";
							SiNo
								Si respuesta[1]="4" Entonces
									Escribir "Maestros";
								SiNo
									Si respuesta[1]="5" Entonces
										Escribir "Pagos";
									SiNo
										Si respuesta[1]="6" Entonces
											Escribir "Becas";
										SiNo
											Si respuesta[1]<>"7" Entonces
												Escribir "Elige una opción válida";
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
									Escribir "Grupos";
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
