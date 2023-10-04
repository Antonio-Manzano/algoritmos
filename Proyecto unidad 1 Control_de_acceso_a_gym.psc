Algoritmo Control_de_acceso_a_gym
	//- Cuantos socios tiene
    //- Por edad
    //- Sexo
    //- Tipo de clase (baile, etc)
    //- Alumnos por clase
	//- Total recaudado en los ultimos meses
	//- Control de clases
	//- Menu de opciones
    //- Servicios
    //- Socios
    //- Consultas
	//contador de la cantidad de estudiantes registrados en la clase baile
	contador_estu_baile=0
	//contador de la cantidad de estudiantes registrados en la clase pesas
	contador_estu_pesas=0
	//contador de la cantidad de estudiantes registrados en la clase aerobics
	contador_estu_aerobics=0
	//contador de la cantidad de estudiantes registrados en la clase cardio
	contador_estu_cardio=0
	//contador de la cantidad de estudiantes registrados en la clase nutricion
	contador_estu_nutricion=0
	//guardamos el servicio que seleccione
	
	Repetir
		
	Escribir "---Menu de Opciones---"
	Escribir "1°-Servicios"
	Escribir "2°-Socios"
	Escribir "3°-Consultas"
	Escribir "4°-Generar Reporte"
	//guardamso la eleccion del usuario
	leer res
	//checamos que es lo que selecciono
	
	Segun res Hacer
			
		1:
			Repetir
			Escribir "---SERVICIOS---"
			Escribir "!Increibles precios semanales¡"
			Escribir "---Seleccione un servicio---"
			Escribir "1.-Clases de BAILE.......$250"
			//valor de la clase de baile
			baile=250
			Escribir "2.-Clases de PESAS.......$300"
			//valor de la clase de pesas
			pesas=300
			Escribir "3.-Clases de AEROBICS....$280"
			//valor de la clase de aerobics
			aerobics=280
			Escribir "4.-Clases de CARDIO......$175"
			//valor de la clase de cardio
			cardio=175
			Escribir "5.-Clases de NUTRICION...$500"
			//valor de la clase de nutricion
			nutricion=500
			Escribir "Ingrese 0 si quiere salir"
			
			leer servicio
			Segun servicio Hacer
				1:
					Escribir "---CLASES DE BAILE---"
					//
					
					Repetir
						//aumentamos la cantidad de personas que entran
						contador_estu_baile=contador_estu_baile+1
						
						Escribir "Informacion del ",contador_estu_baile," estudiante"
					
						Repetir
							Escribir "Sexo (M/F):"
							//sexo del socio
							leer sexo_baile
							si sexo_baile<>"m" y sexo_baile<>"M" y osexo_baile<>"f" y sexo_baile<>"F" Entonces
								Escribir "Opcion no valida"
							FinSi
						Hasta Que sexo_baile="m"o sexo_baile="M" o sexo_baile="f" o sexo_baile="F"
						//edad del socio
						Escribir "Edad:"
						leer edad_baile
						Escribir "Mes de registro:"
						Escribir "1°-Enero"
						Escribir "2°-Febrero"
						Escribir "3°-Marzo"
						Escribir "4°-Abril"
						Escribir "5°-Mayo"
						Escribir "6°-Junio"
						Escribir "7°-Julio"
						Escribir "8°-Agosto"
						Escribir "9°-Septiembre"
						//guarda el mes del registro
						leer mes
						Segun mes Hacer
							1:
								//sumamos uno a la cantidad de socios en enero
								enero_baile=enero_baile+1
								//se suma la cantidad del costo en el mes
								con_enero=con_enero+baile
							2:
								//sumamos uno a la cantidad de socios en febrero
								febrero_baile=febrero_baile+1
								//se suma la cantidad del costo en el mes
								con_febrero=con_febrero+baile
							3:
								//sumamos uno a la cantidad de socios en marzo
								marzo_baile=marzo_baile+1
								//se suma la cantidad del costo en el mes
								con_marzo=con_marzo+baile
							4:
								//sumamos uno a la cantidad de socios en abril
								abrirl_baile=abril_baile+1
								//se suma la cantidad del costo en el mes
								con_abril=con_abril+baile
							5:
								//sumamos uno a la cantidad de socios en mayo
								mayo_baile=mayo_baile+1
								//se suma la cantidad del costo en el mes
								con_mayo=con_mayo+baile
							6:
								//sumamos uno a la cantidad de socios en junio
								junio_baile=junio_baile+1
								//se suma la cantidad del costo en el mes
								con_junio=con_junio+baile
							7:
								//sumamos uno a la cantidad de socios en julio
								julio_baile=julio_baile+1
								//se suma la cantidad del costo en el mes
								con_julio=con_julio+baile
							8:
								//sumamos uno a la cantidad de socios en agosto
								agosto_baile=agosto_baile+1
								//se suma la cantidad del costo en el mes
								con_agosto=con_agosto+baile
							9:
								//sumamos uno a la cantidad de socios en septiembre
								septiembre_baile=septiembre_baile+1
								//se suma la cantidad del costo en el mes
								con_septiembre=con_septiembre+baile
							De Otro Modo:
								Escribir "-///NO ES UNA OPCION///-"
						Fin Segun
						si sexo_baile="m" o sexo_baile="M" Entonces
							//si el sexo es masculino se suma al contador de masculino
							masculino_baile=masculino_baile+1
						SiNo
							si sexo_baile="f" o sexo_baile="F" Entonces
								//si el sexo es femenino se suma al contador femenino
								femenino_baile=femenino_baile+1
							FinSi
						FinSi
						si edad_baile >=18 y edad_baile<=20 Entonces
							//guardar si tiene socios de una edad entre 18 y 20 años
							contador20_baile=contador20_baile+1
						SiNo
							si edad_baile>20 y edad_baile <=25 Entonces
								//guardar si tiene socios de una edad entre 21 y 25 años
								contador25_baile=contador25_baile+1
							SiNo
								si edad_baile>25 y edad_baile<=30 Entonces
									//guardar si tiene socios de una edad entre 26 y 30 años
									contador30_baile=contador30_baile+1
								sino 
									si edad_baile>30 y edad_baile<=40 Entonces
										//guardar si tiene socios de una edad entre 31 y 40 años
										contador40_baile=contador40_baile+1
									SiNo
										si edad_baile>40 y edad_baile<=50 Entonces
											//guardar si tiene socios de una edad entre 41 y 50 años
											contador50_baile=contador50_baile+1
										sino 
											si edad_baile >0 y edad_baile <18 Entonces
												//guardar si tiene socios de una edad menor a 18
												contadormenor_baile=contadormenor_baile+1
											
											SiNo
												si edad_baile>50 Entonces
													//guardar si tiene socios de una edad mayor a 50
													contadormayor_baile=contadormayor_baile+1
												FinSi
											FinSi
										FinSi
									FinSi
								FinSi
							fin si
							
						FinSi
						
						Escribir "¿Quiere ingresar a otro estudiante? 1.-Si/2.-No"
						//guardamos el si quiere continuar o no 
						leer quiere
						
					Hasta Que quiere <> 1
					//total de los ingresos de los socios de baile
					total1=contador_estu_baile*baile
					//ingresos en los ultimos dos meses de los socios de baile
					ultimos1=(septiembre_baile+agosto_baile)*baile
				2:
					Escribir "---CLASES DE PESAS---"
					//
					
					Repetir
						//aumentamos la cantidad de personas que entran
						contador_estu_pesas=contador_estu_pesas+1
						Escribir "Informacion del ",contador_estu_pesas," estudiante"
						Escribir "Sexo (M/F):"
						//sexo del socio
						leer sexo_pesas
						Repetir
							leer sexo_pesas
							si sexo_pesas<>"m" y sexo_pesas<>"M" y sexo_pesas<>"f" y sexo_pesas<>"F" Entonces
								Escribir "Opcion no valida"
							FinSi
						Hasta Que sexo_pesas="m" o sexo_pesas="M" o sexo_pesas="f" o sexo_pesas="F"
						//edad del socio
						Escribir "Edad:"
						leer edad_pesas
						Escribir "Mes de registro:"
						Escribir "1°-Enero"
						Escribir "2°-Febrero"
						Escribir "3°-Marzo"
						Escribir "4°-Abril"
						Escribir "5°-Mayo"
						Escribir "6°-Junio"
						Escribir "7°-Julio"
						Escribir "8°-Agosto"
						Escribir "9°-Septiembre"
						//guarda el mes del registro
						leer mes
						Segun mes Hacer
							1:
								//sumamos uno a la cantidad de socios en enero
								enero_pesas=enero_pesas+1
								//se suma la cantidad del costo en el mes
								con_enero=con_enero+pesas
							2:
								//sumamos uno a la cantidad de socios en febrero
								febrero_pesas=febrero_pesas+1
								//se suma la cantidad del costo en el mes
								con_febrero=con_febrero+pesas
							3:
								//sumamos uno a la cantidad de socios en marzo
								marzo_pesas=marzo_pesas+1
								//se suma la cantidad del costo en el mes
								con_marzo=con_marzo+pesas
							4:
								//sumamos uno a la cantidad de socios en abril
								abrirl_pesas=abril_pesas+1
								//se suma la cantidad del costo en el mes
								con_abril=con_abril+pesas
							5:
								//sumamos uno a la cantidad de socios en mayo
								mayo_pesas=mayo_pesas+1
								//se suma la cantidad del costo en el mes
								con_mayo=con_mayo+pesas
							6:
								//sumamos uno a la cantidad de socios en junio
								junio_pesas=junio_pesas+1
								//se suma la cantidad del costo en el mes
								con_junio=con_junio+pesas
							7:
								//sumamos uno a la cantidad de socios en julio
								julio_pesas=julio_pesas+1
								//se suma la cantidad del costo en el mes
								con_julio=con_julio+pesas
							8:
								//sumamos uno a la cantidad de socios en agosto
								agosto_pesas=agosto_pesas+1
								//se suma la cantidad del costo en el mes
								con_agosto=con_agosto+pesas
							9:
								//sumamos uno a la cantidad de socios en septiembre
								septiembre_pesas=septiembre_pesas+1
								//se suma la cantidad del costo en el mes
								con_septiembre=con_septiembre+pesas
							De Otro Modo:
								Escribir "-///NO ES UNA OPCION///-"
						Fin Segun
						si sexo_pesas="m" o sexo_pesas="M" Entonces
							//si el sexo es masculino se suma al contador de masculino
							masculino_pesas=masculino_pesas+1
						SiNo
							si sexo_pesas="f" o sexo_pesas="F" Entonces
								//si el sexo es femenino se suma al contador femenino
								femenino_pesas=femenino_pesas+1
							FinSi
						FinSi
						si edad_pesas >=18 y edad_pesas<=20 Entonces
							//guardar si tiene socios de una edad entre 18 y 20 años
							contador20_pesas=contador20_pesas+1
						SiNo
							si edad_pesas>20 y edad_pesas <=25 Entonces
								//guardar si tiene socios de una edad entre 21 y 25 años
								contador25_pesas=contador25_pesas+1
							SiNo
								si edad_pesas>25 y edad_pesas<=30 Entonces
									//guardar si tiene socios de una edad entre 26 y 30 años
									contador30_pesas=contador30_pesas+1
								sino 
									si edad_pesas>30 y edad_pesas<=40 Entonces
										//guardar si tiene socios de una edad entre 31 y 40 años
										contador40_pesas=contador40_pesas+1
									SiNo
										si edad_pesas>40 y edad_pesas<=50 Entonces
											//guardar si tiene socios de una edad entre 41 y 50 años
											contador50_pesas=contador50_pesas+1
										sino 
											si edad_pesas >0 y edad_pesas <18 Entonces
												//guardar si tiene socios de una edad menor a 18
												contadormenor_pesas=contadormenor_pesas+1
											
											SiNo
												si edad_pesas>50 Entonces
													//guardar si tiene socios de una edad mayor a 50
													contadormayor_pesas=contadormayor_pesas+1
												FinSi
											FinSi
										FinSi
									FinSi
								FinSi
							fin si
							
						FinSi
						Escribir "¿Quiere ingresar a otro estudiante? 1.-Si/2.-No"
						//guardamos el si quiere continuar o no 
						leer quiere
						
					Hasta Que quiere <> 1
					//total de los ingresos de los socios de pesas
		            total2=contador_estu_pesas*pesas
					//ingresos en los ultimos dos meses de los socios de pesas
					ultimos2=(septiembre_pesas+agosto_pesas)*pesas
				3:
					Escribir "---CLASES DE AEROBICS---"
					//
					
					Repetir
						//aumentamos la cantidad de personas que entran
						contador_estu_aerobics=contador_estu_aerobics+1
					Escribir "Informacion del ",contador_estu_aerobics," estudiante"
						
						Repetir
							Escribir "Sexo (M/F):"
							//sexo del socio
							leer sexo_aerobics
							si sexo_aerobics<>"m" y sexo_aerobics<>"M" y sexo_aerobics<>"f" y sexo_aerobics<>"F" Entonces
								Escribir "Opcion no valida"
							FinSi
						Hasta Que sexo_aerobics="m" o sexo_aerobics="M" o sexo_aerobics="f" o sexo_aerobics="F"
						//edad del socio
						Escribir "Edad:"
						leer edad_aerobics
						Escribir "Mes de registro:"
						Escribir "1°-Enero"
						Escribir "2°-Febrero"
						Escribir "3°-Marzo"
						Escribir "4°-Abril"
						Escribir "5°-Mayo"
						Escribir "6°-Junio"
						Escribir "7°-Julio"
						Escribir "8°-Agosto"
						Escribir "9°-Septiembre"
						//guarda el mes del registro
						leer mes
						Segun mes Hacer
							1:
								//sumamos uno a la cantidad de socios en enero
								enero_aerobics=enero_aerobics+1
								//se suma la cantidad del costo en el mes
								con_enero=con_enero+aerobics
							2:
								//sumamos uno a la cantidad de socios en febrero
								febrero_aerobics=febrero_aerobics+1
								//se suma la cantidad del costo en el mes
								con_febrero=con_febrero+aerobics
							3:
								//sumamos uno a la cantidad de socios en marzo
								marzo_aerobics=marzo_aerobics+1
								//se suma la cantidad del costo en el mes
								con_marzo=con_marzo+aerobics
							4:
								//sumamos uno a la cantidad de socios en abril
								abrirl_aerobics=abril_aerobics+1
								//se suma la cantidad del costo en el mes
								con_abril=con_abril+aerobics
							5:
								//sumamos uno a la cantidad de socios en mayo
								mayo_aerobics=mayo_aerobics+1
								//se suma la cantidad del costo en el mes
								con_mayo=con_mayo+aerobics
							6:
								//sumamos uno a la cantidad de socios en junio
								junio_aerobics=junio_aerobics+1
								//se suma la cantidad del costo en el mes
								con_junio=con_junio+aerobics
							7:
								//sumamos uno a la cantidad de socios en julio
								julio_aerobics=julio_aerobics+1
								//se suma la cantidad del costo en el mes
								con_julio=con_julio+aerobics
							8:
								//sumamos uno a la cantidad de socios en agosto
								agosto_aerobics=agosto_aerobics+1
								//se suma la cantidad del costo en el mes
								con_agosto=con_agosto+aerobics
							9:
								//sumamos uno a la cantidad de socios en septiembre
								septiembre_aerobics=septiembre_aerobics+1
								//se suma la cantidad del costo en el mes
								con_septiembre=con_septiembre+aerobics
							De Otro Modo:
								Escribir "-///NO ES UNA OPCION///-"
						Fin Segun
						si sexo_aerobics="m" o sexo_aerobics="M" Entonces
							//si el sexo es masculino se suma al contador de masculino
							masculino_aerobics=masculino_aerobics+1
						SiNo
							si sexo_aerobics="f" o sexo_aerobics="F" Entonces
								//si el sexo es femenino se suma al contador femenino
								femenino_aerobics=femenino_aerobics+1
							FinSi
						FinSi
						si edad_aerobics >=18 y edad_aerobics<=20 Entonces
							//guardar si tiene socios de una edad entre 18 y 20 años
							contador20_aerobics=contador20_aerobics+1
						SiNo
							si edad_aerobics>20 y edad_aerobics <=25 Entonces
								//guardar si tiene socios de una edad entre 21 y 25 años
								contador25_aerobics=contador25_aerobics+1
							SiNo
								si edad_aerobics>25 y edad_aerobics<=30 Entonces
									//guardar si tiene socios de una edad entre 26 y 30 años
									contador30_aerobics=contador30_aerobics+1
								sino 
									si edad_aerobics>30 y edad_aerobics<=40 Entonces
										//guardar si tiene socios de una edad entre 31 y 40 años
										contador40_aerobics=contador40_aerobics+1
									SiNo
										si edad_aerobics>40 y edad_aerobics<=50 Entonces
											//guardar si tiene socios de una edad entre 41 y 50 años
											contador50_aerobics=contador50_aerobics+1
										sino 
											si edad_aerobics >0 y edad_aerobics <18 Entonces
												//guardar si tiene socios de una edad menor a 18
												contadormenor_aerobics=contadormenor_aerobics+1
											
											SiNo
												si edad_aerobics>50 Entonces
													//guardar si tiene socios de una edad mayor a 50
													contadormayor_aerobics=contadormayor_aerobics+1
												FinSi
											FinSi
										FinSi
									FinSi
								FinSi
							fin si
							
						FinSi
						Escribir "¿Quiere ingresar a otro estudiante? 1.-Si/2.-No"
						//guardamos el si quiere continuar o no 
						leer quiere
						
					Hasta Que quiere <> 1
					//total de los ingresos de los socios de aerobics
		            total3=contador_estu_aerobics*aerobics
					//ingresos en los ultimos dos meses de los socios de aerobics
					ultimos3=(septiembre_aerobics+agosto_aerobics)*aerobics
				4:
					Escribir "---CLASES DE CARDIO---"
					//
					
					Repetir
						//aumentamos la cantidad de personas que entran
						contador_estu_cardio=contador_estu_cardio+1
						Escribir "Informacion del ",contador_estu_cardio," estudiante"
						
						Repetir
							Escribir "Sexo (M/F):"
							//sexo del socio
							leer sexo_cardio
							si sexo_cardio<>"m" y sexo_cardio<>"M" y sexo_cardio<>"f" y sexo_cardio<>"F" Entonces
								Escribir "Opcion no valida"
							FinSi
						Hasta Que sexo_cardio="m" o sexo_cardio="M" o sexo_cardio="f" o sexo_cardio="F"
						//edad del socio
						Escribir "Edad:"
						leer edad_cardio
						Escribir "Mes de registro:"
						Escribir "1°-Enero"
						Escribir "2°-Febrero"
						Escribir "3°-Marzo"
						Escribir "4°-Abril"
						Escribir "5°-Mayo"
						Escribir "6°-Junio"
						Escribir "7°-Julio"
						Escribir "8°-Agosto"
						Escribir "9°-Septiembre"
						//guarda el mes del registro
						leer mes
						Segun mes Hacer
							1:
								//sumamos uno a la cantidad de socios en enero
								enero_cardio=enero_cardio+1
								//se suma la cantidad del costo en el mes
								con_enero=con_enero+cardio
							2:
								//sumamos uno a la cantidad de socios en febrero
								febrero_cardio=febrero_cardio+1
								//se suma la cantidad del costo en el mes
								con_febrero=con_febrero+cardio
							3:
								//sumamos uno a la cantidad de socios en marzo
								marzo_cardio=marzo_cardio+1
								//se suma la cantidad del costo en el mes
								con_marzo=con_marzo+cardio
							4:
								//sumamos uno a la cantidad de socios en abril
								abrirl_cardio=abril_cardio+1
								//se suma la cantidad del costo en el mes
								con_abril=con_abril+cardio
							5:
								//sumamos uno a la cantidad de socios en mayo
								mayo_cardio=mayo_cardio+1
								//se suma la cantidad del costo en el mes
								con_mayo=con_mayo+cardio
							6:
								//sumamos uno a la cantidad de socios en junio
								junio_cardio=junio_cardio+1
								//se suma la cantidad del costo en el mes
								con_junio=con_junio+cardio
							7:
								//sumamos uno a la cantidad de socios en julio
								julio_cardio=julio_cardio+1
								//se suma la cantidad del costo en el mes
								con_julio=con_julio+cardio
							8:
								//sumamos uno a la cantidad de socios en agosto
								agosto_cardio=agosto_cardio+1
								//se suma la cantidad del costo en el mes
								con_agosto=con_agosto+cardio
							9:
								//sumamos uno a la cantidad de socios en septiembre
								septiembre_cardio=septiembre_cardio+1
								//se suma la cantidad del costo en el mes
								con_septiembre=con_septiembre+cardio
							De Otro Modo:
								Escribir "-///NO ES UNA OPCION///-"
						Fin Segun
						si sexo_cardio="m" o sexo_cardio="M" Entonces
							//si el sexo es masculino se suma al contador de masculino
							masculino_cardio=masculino_cardio+1
						SiNo
							si sexo_cardio="f" o sexo_cardio="F" Entonces
								//si el sexo es femenino se suma al contador femenino
								femenino_cardio=femenino_cardio+1
							FinSi
						FinSi
						si edad_cardio >=18 y edad_cardio<=20 Entonces
							//guardar si tiene socios de una edad entre 18 y 20 años
							contador20_cardio=contador20_cardio+1
						SiNo
							si edad_cardio>20 y edad_cardio <=25 Entonces
								//guardar si tiene socios de una edad entre 21 y 25 años
								contador25_cardio=contador25_cardio+1
							SiNo
								si edad_cardio>25 y edad_cardio<=30 Entonces
									//guardar si tiene socios de una edad entre 26 y 30 años
									contador30_cardio=contador30_cardio+1
								sino 
									si edad_cardio>30 y edad_cardio<=40 Entonces
										//guardar si tiene socios de una edad entre 31 y 40 años
										contador40_cardio=contador40_cardio+1
									SiNo
										si edad_cardio>40 y edad_cardio<=50 Entonces
											//guardar si tiene socios de una edad entre 41 y 50 años
											contador50_cardio=contador50_cardio+1
										sino 
											si edad_cardio >0 y edad_cardio <18 Entonces
												//guardar si tiene socios de una edad menor a 18
												contadormenor_cardio=contadormenor_cardio+1
											
											SiNo
												si edad_cardio>50 Entonces
													//guardar si tiene socios de una edad mayor a 50
													contadormayor_cardio=contadormayor_cardio+1
												FinSi
											FinSi
										FinSi
									FinSi
								FinSi
							fin si
							
						FinSi
						Escribir "¿Quiere ingresar a otro estudiante? 1.-Si/2.-No"
						//guardamos el si quiere continuar o no 
						leer quiere
						
					Hasta Que quiere <> 1
					//total de los ingresos de los socios de cardio
		            total4=contador_estu_cardio*cardio
					//ingresos en los ultimos dos meses de los socios de cardio
					ultimos4=(septiembre_cardio+agosto_cardio)*cardio
				5:
					Escribir "---CLASES DE NUTRICION---"
					//
					
					Repetir
						//aumentamos la cantidad de personas que entran
						contador_estu_nutricion=contador_estu_nutricion+1
						Escribir "Informacion del ",contador_estu_nutricion," estudiante"
						
						Repetir
							Escribir "Sexo (M/F):"
							//sexo del socio
							leer sexo_nutricion
							si sexo_nutricion<>"m" y sexo_nutricion<>"M" y sexo_nutricion<>"f" y sexo_nutricion<>"F" Entonces
								Escribir "Opcion no valida"
							FinSi
						Hasta Que sexo_nutricion="m" o sexo_nutricion="M" o sexo_nutricion="f" o sexo_nutricion="F"
						//edad del socio
						Escribir "Edad:"
						
						leer edad_nutricion
						Escribir "Mes de registro:"
						Escribir "1°-Enero"
						Escribir "2°-Febrero"
						Escribir "3°-Marzo"
						Escribir "4°-Abril"
						Escribir "5°-Mayo"
						Escribir "6°-Junio"
						Escribir "7°-Julio"
						Escribir "8°-Agosto"
						Escribir "9°-Septiembre"
						//guarda el mes del registro
						leer mes
						Segun mes Hacer
							1:
								//sumamos uno a la cantidad de socios en enero
								enero_nutricion=enero_nutricion+1
								//se suma la cantidad del costo en el mes
								con_enero=con_enero+nutricion
							2:
								//sumamos uno a la cantidad de socios en febrero
								febrero_nutricion=febrero_nutricion+1
								//se suma la cantidad del costo en el mes
								con_febrero=con_febrero+nutricion
							3:
								//sumamos uno a la cantidad de socios en marzo
								marzo_nutricion=marzo_nutricion+1
								//se suma la cantidad del costo en el mes
								con_marzo=con_marzo+nutricion
							4:
								//sumamos uno a la cantidad de socios en abril
								abrirl_nutricion=abril_nutricion+1
								//se suma la cantidad del costo en el mes
								con_abril=con_abril+nutricion
							5:
								//sumamos uno a la cantidad de socios en mayo
								mayo_nutricion=mayo_nutricion+1
								//se suma la cantidad del costo en el mes
								con_mayo=con_mayo+nutricion
							6:
								//sumamos uno a la cantidad de socios en junio
								junio_nutricion=junio_nutricion+1
								//se suma la cantidad del costo en el mes
								con_junio=con_junio+nutricion
							7:
								//sumamos uno a la cantidad de socios en julio
								julio_nutricion=julio_nutricion+1
								//se suma la cantidad del costo en el mes
								con_julio=con_julio+nutricion
							8:
								//sumamos uno a la cantidad de socios en agosto
								agosto_nutricion=agosto_nutricion+1
								//se suma la cantidad del costo en el mes
								con_agosto=con_agosto+nutricion
							9:
								//sumamos uno a la cantidad de socios en septiembre
								septiembre_nutricion=septiembre_nutricion+1
								//se suma la cantidad del costo en el mes
								con_septiembre=con_septiembre+nutricion
							De Otro Modo:
								Escribir "-///NO ES UNA OPCION///-"
						Fin Segun
						si sexo_nutricion="m" o sexo_nutricion="M" Entonces
							//si el sexo es masculino se suma al contador de masculino
							masculino_nutricion=masculino_nutricion+1
						SiNo
							si sexo_nutricion="f" o sexo_nutricion="F" Entonces
								//si el sexo es femenino se suma al contador femenino
								femenino_nutricion=femenino_nutricion+1
							FinSi
						FinSi
						si edad_nutricion >=18 y edad_nutricion<=20 Entonces
							//guardar si tiene socios de una edad entre 18 y 20 años
							contador20_nutricion=contador20_nutricion+1
						SiNo
							si edad_nutricion>20 y edad_nutricion <=25 Entonces
								//guardar si tiene socios de una edad entre 21 y 25 años
								contador25_nutricion=contador25_nutricion+1
							SiNo
								si edad_nutricion>25 y edad_nutricion<=30 Entonces
									//guardar si tiene socios de una edad entre 26 y 30 años
									contador30_nutricion=contador30_nutricion+1
								sino 
									si edad_nutricion>30 y edad_nutricion<=40 Entonces
										//guardar si tiene socios de una edad entre 31 y 40 años
										contador40_nutricion=contador40_nutricion+1
									SiNo
										si edad_nutricion>40 y edad_nutricion<=50 Entonces
											//guardar si tiene socios de una edad entre 41 y 50 años
											contador50_nutricion=contador50_nutricion+1
										sino 
											si edad_nutricion >0 y edad_nutricion <18 Entonces
												//guardar si tiene socios de una edad menor a 18
												contadormenor_nutricion=contadormenor_nutricion+1
											
											SiNo
												si edad_nutricion>50 Entonces
													//guardar si tiene socios de una edad mayor a 50
													contadormayor_nutricion=contadormayor_nutricion+1
												FinSi
											FinSi
										FinSi
									FinSi
								FinSi
							fin si
							
						FinSi
						Escribir "¿Quiere ingresar a otro estudiante? 1.-Si/2.-No"
						//guardamos el si quiere continuar o no 
						leer quiere
						
					Hasta Que quiere <> 1
					//total de los ingresos de los socios de nutricion
		            total5=contador_estu_nutricion*nutricion
					//ingresos en los ultimos dos meses de los socios de nutricion
					ultimos5=(septiembre_nutricion+agosto_nutricion)*nutricion
				De Otro Modo:
					Escribir "Opcion no valida"
			Fin Segun
			Escribir "Continuar con los registros 1°-si/2°-no"
			//guarda si quiere realizar otro registro
			leer cont
		Hasta Que cont<>1
		2:
			Escribir "---SOCIOS---"
			Repetir
				Escribir "---Ver Informacion de un Socio---"
				Escribir "1.-Socios de BAILE"
				Escribir "2.-Socios de PESAS"
				Escribir "3.-Socios de AEROBICS"
				Escribir "4.-Socios de CARDIO"
				Escribir "5.-Socios de NUTRICION"
				Escribir "6.-Salir"
				//se registra la opcion de los socios de los cuales quiere conocer la informacion
				Leer info
				Segun info Hacer
					1:
						Escribir "Cantidad de socios en la clase de BAILE:",contador_estu_baile
						Escribir "--Sexo--"
						Escribir "Masculinos:",masculino_baile
						Escribir "Femeninas:",femenino_baile
						Escribir "--Edades--"
						Escribir "Menores de 18:",contadormenor_baile
						Escribir "Entre 18 y 20:",contador20_baile
						Escribir "Entre 20 y 25:",contador25_baile
						Escribir "Entre 25 y 30:",contador30_baile
						Escribir "Entre 30 y 40:",contador40_baile
						Escribir "Entre 40 y 50:",contador50_baile
						Escribir "Mayores de 50:",contadormenor_baile
						Escribir "Personas Inscritas al Mes:"
						Escribir "Enero:",enero_baile
						Escribir "Febrero:",febrero_baile
						Escribir "Marzo:",marzo_baile
						Escribir "Abril:",abril_baile
						Escribir "Mayo:",mayo_baile
						Escribir "Junio:",junio_baile
						Escribir "Julio:",julio_baile
						Escribir "Agosto:",agosto_baile
						Escribir "Septiembre:",septiembre_baile
					2:
						Escribir "Cantidad de socios en la clase de PESAS:",contador_estu_pesas
						Escribir "--Sexo--"
						Escribir "Masculinos:",masculino_pesas
						Escribir "Femeninas:",femenino_pesas
						Escribir "--Edades--"
						Escribir "Menores de 18:",contadormenor_pesas
						Escribir "Entre 18 y 20:",contador20_pesas
						Escribir "Entre 20 y 25:",contador25_pesas
						Escribir "Entre 25 y 30:",contador30_pesas
						Escribir "Entre 30 y 40:",contador40_pesas
						Escribir "Entre 40 y 50:",contador50_pesas
						Escribir "Mayores de 50:",contadormenor_pesas
						Escribir "Personas Inscritas al Mes:"
						Escribir "Enero:",enero_pesas
						Escribir "Febrero:",febrero_pesas
						Escribir "Marzo:",marzo_pesas
						Escribir "Abril:",abril_pesas
						Escribir "Mayo:",mayo_pesas
						Escribir "Junio:",junio_pesas
						Escribir "Julio:",julio_pesas
						Escribir "Agosto:",agosto_pesas
						Escribir "Septiembre:",septiembre_pesas
					3:
						Escribir "Cantidad de socios en la clase de AEROBICS:",contador_estu_aerobics
						Escribir "--Sexo--"
						Escribir "Masculinos:",masculino_aerobics
						Escribir "Femeninas:",femenino_aerobics
						Escribir "--Edades--"
						Escribir "Menores de 18:",contadormenor_aerobics
						Escribir "Entre 18 y 20:",contador20_aerobics
						Escribir "Entre 20 y 25:",contador25_aerobics
						Escribir "Entre 25 y 30:",contador30_aerobics
						Escribir "Entre 30 y 40:",contador40_aerobics
						Escribir "Entre 40 y 50:",contador50_aerobics
						Escribir "Mayores de 50:",contadormenor_aerobics
						Escribir "Personas Inscritas al Mes:"
						Escribir "Enero:",enero_aerobics
						Escribir "Febrero:",febrero_aerobics
						Escribir "Marzo:",marzo_aerobics
						Escribir "Abril:",abril_aerobics
						Escribir "Mayo:",mayo_aerobics
						Escribir "Junio:",junio_aerobics
						Escribir "Julio:",julio_aerobics
						Escribir "Agosto:",agosto_aerobics
						Escribir "Septiembre:",septiembre_aerobics
					4:
						Escribir "Cantidad de socios en la clase de CARDIO:",contador_estu_cardio
						Escribir "--Sexo--"
						Escribir "Masculinos:",masculino_cardio
						Escribir "Femeninas:",femenino_cardio
						Escribir "--Edades--"
						Escribir "Menores de 18:",contadormenor_cardio
						Escribir "Entre 18 y 20:",contador20_cardio
						Escribir "Entre 20 y 25:",contador25_cardio
						Escribir "Entre 25 y 30:",contador30_cardio
						Escribir "Entre 30 y 40:",contador40_cardio
						Escribir "Entre 40 y 50:",contador50_cardio
						Escribir "Mayores de 50:",contadormenor_cardio
						Escribir "Personas Inscritas al Mes:"
						Escribir "Enero:",enero_cardio
						Escribir "Febrero:",febrero_cardio
						Escribir "Marzo:",marzo_cardio
						Escribir "Abril:",abril_cardio
						Escribir "Mayo:",mayo_cardio
						Escribir "Junio:",junio_cardio
						Escribir "Julio:",julio_cardio
						Escribir "Agosto:",agosto_cardio
						Escribir "Septiembre:",septiembre_cardio
					5:
						Escribir "Cantidad de socios en la clase de NUTRICION",contador_estu_nutricion
						Escribir "--Sexo--"
						Escribir "Masculinos:",masculino_nutricion
						Escribir "Femeninas:",femenino_nutricion
						Escribir "--Edades--"
						Escribir "Menores de 18:",contadormenor_nutricion
						Escribir "Entre 18 y 20:",contador20_nutricion
						Escribir "Entre 20 y 25:",contador25_nutricion
						Escribir "Entre 25 y 30:",contador30_nutricion
						Escribir "Entre 30 y 40:",contador40_nutricion
						Escribir "Entre 40 y 50:",contador50_nutricion
						Escribir "Mayores de 50:",contadormenor_nutricion
						Escribir "Personas Inscritas al Mes:"
						Escribir "Enero:",enero_nutricion
						Escribir "Febrero:",febrero_nutricion
						Escribir "Marzo:",marzo_nutricion
						Escribir "Abril:",abril_nutricion
						Escribir "Mayo:",mayo_nutricion
						Escribir "Junio:",junio_nutricion
						Escribir "Julio:",julio_nutricion
						Escribir "Agosto:",agosto_nutricion
						Escribir "Septiembre:",septiembre_nutricion
					6:
						
					De Otro Modo:
						Escribir "-///NO ES UNA OPCION///-"
				Fin Segun
				Escribir "Mostrar mas socios 1.-Si/2.-No"
				//registrar si quiere o no mostrar el registro de mas socios 
				leer mos
			Hasta Que mos<>1
			
			
		3:
			Escribir "---CONSULTAS---"
			Escribir "--Realizar consulta de:--"
			Escribir "1°-BAILE"
			Escribir "2°-PESAS"
			Escribir "3°-AEROBICS"
			Escribir "4°-CARDIO"
			Escribir "5°-NUTRICION"
			Escribir "6°-Salir"
			//se guarda la consulta que se quiere realizar
			Leer consulta
			Segun consulta Hacer
				1:
					
					Escribir "Ingresos totales:",total1
					Escribir "Ingresos en los ultimos 2 meses:",ultimos1
				2:
					
					Escribir "Ingresos totales:",total2
					Escribir "Ingresos en los ultimos 2 meses:",ultimos2
				3:
					
					Escribir "Ingresos totales:",total3
					Escribir "Ingresos en los ultimos 2 meses:",ultimos3
				4:
					
					Escribir "Ingresos totales:",total4
					Escribir "Ingresos en los ultimos 2 meses:",ultimos4
				5:
					
					Escribir "Ingresos totales:",total5
					Escribir "Ingresos en los ultimos 2 meses:",ultimos5
				6:
					
				De Otro Modo:
					Escribir "-///NO ES UNA OPCION///-"
			Fin Segun
		4:
			Escribir "---REPORTE---"
			//total final de las ganancias
			gtotal=total1+total2+total3+total4+total5
			Escribir "Total de ganancias en el GYM:",gtotal
			//total de ingresos en los ultimos 2 meses
			tultimos=ultimos1+ultimos2+ultimos3+ultimos4+ultimos5
			Escribir "Total de ingresos en los ultimos 2 meses:",tultimos
			//solo se mostrara el registro de la clase si se ingresaron datos en servicios
			si contador_estu_baile<>0 Entonces
				Escribir "Cantidad de socios en la clase de BAILE:",contador_estu_baile
				Escribir "--Sexo--"
				Escribir "Masculinos:",masculino_baile
				Escribir "Femeninas:",femenino_baile
				Escribir "--Edades--"
				Escribir "Menores de 18:",contadormenor_baile
				Escribir "Entre 18 y 20:",contador20_baile
				Escribir "Entre 20 y 25:",contador25_baile
				Escribir "Entre 25 y 30:",contador30_baile
				Escribir "Entre 30 y 40:",contador40_baile
				Escribir "Entre 40 y 50:",contador50_baile
				Escribir "Mayores de 50:",contadormenor_baile
				Escribir "Personas Inscritas al Mes:"
				Escribir "Enero:",enero_baile
				Escribir "Febrero:",febrero_baile
				Escribir "Marzo:",marzo_baile
				Escribir "Abril:",abril_baile
				Escribir "Mayo:",mayo_baile
				Escribir "Junio:",junio_baile
				Escribir "Julio:",julio_baile
				Escribir "Agosto:",agosto_baile
				Escribir "Septiembre:",septiembre_baile
				Escribir "Ingresos totales en la clase:",total1
				Escribir "Ingresos en los ultimos 2 meses de la clase:",ultimos1
			FinSi
			//solo se mostrara el registro de la clase si se ingresaron datos en servicios
			si contador_estu_pesas<>0 Entonces
				Escribir "Cantidad de socios en la clase de PESAS:",contador_estu_pesas
				Escribir "--Sexo--"
				Escribir "Masculinos:",masculino_pesas
				Escribir "Femeninas:",femenino_pesas
				Escribir "--Edades--"
				Escribir "Menores de 18:",contadormenor_pesas
				Escribir "Entre 18 y 20:",contador20_pesas
				Escribir "Entre 20 y 25:",contador25_pesas
				Escribir "Entre 25 y 30:",contador30_pesas
				Escribir "Entre 30 y 40:",contador40_pesas
				Escribir "Entre 40 y 50:",contador50_pesas
				Escribir "Mayores de 50:",contadormenor_pesas
				Escribir "Personas Inscritas al Mes:"
				Escribir "Enero:",enero_pesas
				Escribir "Febrero:",febrero_pesas
				Escribir "Marzo:",marzo_pesas
				Escribir "Abril:",abril_pesas
				Escribir "Mayo:",mayo_pesas
				Escribir "Junio:",junio_pesas
				Escribir "Julio:",julio_pesas
				Escribir "Agosto:",agosto_pesas
				Escribir "Septiembre:",septiembre_pesas
				Escribir "Ingresos totales en la clase:",total2
				Escribir "Ingresos en los ultimos 2 meses de la clase:",ultimos2
			FinSi
			//solo se mostrara el registro de la clase si se ingresaron datos en servicios
			si contador_estu_aerobics<>0 Entonces
				Escribir "Cantidad de socios en la clase de AEROBICS:",contador_estu_aerobics
				Escribir "--Sexo--"
				Escribir "Masculinos:",masculino_aerobics
				Escribir "Femeninas:",femenino_aerobics
				Escribir "--Edades--"
				Escribir "Menores de 18:",contadormenor_aerobics
				Escribir "Entre 18 y 20:",contador20_aerobics
				Escribir "Entre 20 y 25:",contador25_aerobics
				Escribir "Entre 25 y 30:",contador30_aerobics
				Escribir "Entre 30 y 40:",contador40_aerobics
				Escribir "Entre 40 y 50:",contador50_aerobics
				Escribir "Mayores de 50:",contadormenor_aerobics
				Escribir "Personas Inscritas al Mes:"
				Escribir "Enero:",enero_aerobics
				Escribir "Febrero:",febrero_aerobics
				Escribir "Marzo:",marzo_aerobics
				Escribir "Abril:",abril_aerobics
				Escribir "Mayo:",mayo_aerobics
				Escribir "Junio:",junio_aerobics
				Escribir "Julio:",julio_aerobics
				Escribir "Agosto:",agosto_aerobics
				Escribir "Septiembre:",septiembre_aerobics
				Escribir "Ingresos totales:",total3
				Escribir "Ingresos en los ultimos 2 meses:",ultimos3
			FinSi
			//solo se mostrara el registro de la clase si se ingresaron datos en servicios
			si contador_estu_cardio<>0 Entonces
				Escribir "Cantidad de socios en la clase de CARDIO:",contador_estu_cardio
				Escribir "--Sexo--"
				Escribir "Masculinos:",masculino_cardio
				Escribir "Femeninas:",femenino_cardio
				Escribir "--Edades--"
				Escribir "Menores de 18:",contadormenor_cardio
				Escribir "Entre 18 y 20:",contador20_cardio
				Escribir "Entre 20 y 25:",contador25_cardio
				Escribir "Entre 25 y 30:",contador30_cardio
				Escribir "Entre 30 y 40:",contador40_cardio
				Escribir "Entre 40 y 50:",contador50_cardio
				Escribir "Mayores de 50:",contadormenor_cardio
				Escribir "Personas Inscritas al Mes:"
				Escribir "Enero:",enero_cardio
				Escribir "Febrero:",febrero_cardio
				Escribir "Marzo:",marzo_cardio
				Escribir "Abril:",abril_cardio
				Escribir "Mayo:",mayo_cardio
				Escribir "Junio:",junio_cardio
				Escribir "Julio:",julio_cardio
				Escribir "Agosto:",agosto_cardio
				Escribir "Septiembre:",septiembre_cardio
				Escribir "Ingresos totales en la clase:",total4
				Escribir "Ingresos en los ultimos 2 meses de la clase:",ultimos4
			FinSi
			//solo se mostrara el registro de la clase si se ingresaron datos en servicios
			si contador_estu_nutricion<>0 Entonces
				Escribir "Cantidad de socios en la clase de NUTRICION",contador_estu_nutricion
				Escribir "--Sexo--"
				Escribir "Masculinos:",masculino_nutricion
				Escribir "Femeninas:",femenino_nutricion
				Escribir "--Edades--"
				Escribir "Menores de 18:",contadormenor_nutricion
				Escribir "Entre 18 y 20:",contador20_nutricion
				Escribir "Entre 20 y 25:",contador25_nutricion
				Escribir "Entre 25 y 30:",contador30_nutricion
				Escribir "Entre 30 y 40:",contador40_nutricion
				Escribir "Entre 40 y 50:",contador50_nutricion
				Escribir "Mayores de 50:",contadormenor_nutricion
				Escribir "Personas Inscritas al Mes:"
				Escribir "Enero:",enero_nutricion
				Escribir "Febrero:",febrero_nutricion
				Escribir "Marzo:",marzo_nutricion
				Escribir "Abril:",abril_nutricion
				Escribir "Mayo:",mayo_nutricion
				Escribir "Junio:",junio_nutricion
				Escribir "Julio:",julio_nutricion
				Escribir "Agosto:",agosto_nutricion
				Escribir "Septiembre:",septiembre_nutricion
				Escribir "Ingresos totales en la clase:",total5
				Escribir "Ingresos en los ultimos 2 meses de la clase:",ultimos5
			FinSi
		De Otro Modo:
			Escribir "-///NO ES UNA OPCION///-"
	Fin Segun
	
	Hasta Que res=4
FinAlgoritmo
