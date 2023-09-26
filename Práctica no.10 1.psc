Algoritmo Vacunas
	Definir vacuna, suministrar Como Entero;
	Definir punto, reparto Como Caracter;
	vacuna<-1000;
	suministrar<-0;
	punto<-"0";
	reparto<-"0";
	Escribir "Tenemos ",vacuna," vacunas a disposición";
	Escribir "Estos son los puntos de reparto que tenemos asignados";
	Escribir " A, B, C, D, E, F, G, H, I, J";
	Repetir
		Repetir
		Escribir "¿A que punto de reparto quiere dejar vacunas?";
		Leer reparto;
		Si(reparto = "A" o reparto = "B" o reparto = "C" o reparto = "D" o reparto = "E" o reparto = "F" o reparto = "G" o reparto = "H" o reparto = "I" o reparto = "J") Entonces
			punto <- "existe";
		Sino
			Escribir "Error, ese punto de reparto no existe";
		FinSi
		Hasta Que (punto = "existe")
		Escribir "¿Cuántas vacunas desea suministrar en este punto?";
		Leer suministrar;
		Si (vacuna >= suministrar) Entonces
			vacuna <- vacuna - suministrar;
			Si (reparto = "A" ) Entonces
				puntoa<-suministrar;
			SiNo
				Si (reparto = "B" ) Entonces
					puntob<-suministrar;
				SiNo
					Si (reparto = "C" ) Entonces
						puntoc<-suministrar;
					SiNo
						Si (reparto = "D" ) Entonces
							puntod<-suministrar;
						SiNo
							Si (reparto = "E" ) Entonces 
								puntoe<-suministrar;
							SiNo
								Si (reparto = "F" ) Entonces 
									puntof<-suministrar;
								SiNo
									Si (reparto = "G") Entonces 
										puntog<-suministrar;
									SiNo
										Si (repartoh = "H") Entonces 
											puntoh<-suministrar;
										SiNo
											Si (reparto = "I") Entonces 
												puntoi<-suministrar;
											SiNo
												Si (reparto = "J") Entonces 
													puntoj<-suministrar;
												FinSi
											FinSi
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
			Si(vacuna <= 200) Entonces
				Escribir "¡Alerta, te quedan 200 vacunas o menos!";
			FinSi
			Si (vacuna = 0) Entonces
				disponibles<-"No";
			FinSi
		SiNo
			Escribir "No tienes suficientes vacunas, te quedan ", vacuna," vacunas introduce otra cantidad";
			Si	(vacuna = 0) Entonces
				disponibles<-"No";
			FinSi
			FinSi
		Si (vacuna=0) Entonces 
			Escribir "Se han acabado las vacunas";
		SiNo
			disponibles<-"Si";
		FinSi
	Hasta Que (disponibles="No")
	Escribir "En el Punto A se suministraron se dejaron", puntoa," vacunas.";
	Escribir "En el Punto B se suministraron se dejaron", puntob," vacunas.";
	Escribir "En el Punto C se suministraron se dejaron", puntoc," vacunas.";
	Escribir "En el Punto D se suministraron se dejaron", puntod," vacunas.";
	Escribir "En el Punto E se suministraron se dejaron", puntoe," vacunas.";
	Escribir "En el Punto F se suministraron se dejaron", puntof," vacunas.";
	Escribir "En el Punto G se suministraron se dejaron", puntog," vacunas.";
	Escribir "En el Punto H se suministraron se dejaron", puntoh," vacunas.";
	Escribir "En el Punto I se suministraron se dejaron", puntoi," vacunas.";
	Escribir "En el Punto J se suministraron se dejaron", puntoj," vacunas.";
	Escribir "En el Punto K se suministraron se dejaron", puntok," vacunas.";
 FinAlgoritmo
