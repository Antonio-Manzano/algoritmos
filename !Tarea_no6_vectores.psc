Algoritmo Tarea_no6_vectores
	Definir x, t, posicionproducto, cantidadproducto, posicionamiento, sucursal, a, f, g, sucursales, recaudado, psucursales, productos, vtotalpc, productosc, sucursalt Como Real
	Definir n Como Entero
	Definir nombrep Como Caracter
		//TAREA 6
	//PSEUDOCODIGO QUE LEEA EL PRECIO DE 5 PRODUCTOS Y LA CANTIDAD DE VENTAS EN UNA EMPRESA EN SUS 4 SUCURSALES
	//INFORMACION QUE DEBE PEDIR:
	//A) LAS CANTIDADES TOTALES DE CADA ARTICULO 
	//B) CANTIDADE DE ARTICULOS EN  SUCURSAL 2
	//C) LA CANTIDA DE ARTICULO 3 EN SUCURSAL 1
	//D) LA RECAUDACION TOTAL POR CADA SUCURSAL 
	//E) LA RECAUDACION TOTAL DE LA EMPRESA
	//F) LA SUCURSAL DE MAYOR RECAUDACION
	//G) LOS CLIENTES QUE MAS COMPRAR POR SUCURSAL
	//H) IMPRIMIR LAS VENTAS TOTALES POR SUCURSAL POR CADA UNO DE LOS CLIENTES
		//Se definen vectores
		Dimension producto[5];
		Dimension sucursales[4];
		Dimension recaudado[4];
		Dimension psucursales[20];
		Escribir "¿Cuántos clientes añadirá?";
		Leer n;
		Dimension nombrep[n];
		Dimension gastos[n];
		Dimension productosc[n];
		Dimension productos[5];
		Dimension vtotalpc[n*20];
		
		//Se inicia un bucle para registrar el costo de cada producto
		Para x<-1 Hasta 5 Hacer
			Escribir "¿Cuánto cuesta el producto número ", x, "?";
			Leer producto[x];
		FinPara
		//Se inicia un bucle para registrar los clientes y que es lo que van a comprar
		Para x<-1 Hasta n Hacer
			Escribir "¿Cuál es el nombre del cliente número ", x, "?";
			Leer nombrep[x];
			//Se inicia el bucle después de elegir comprar en otra sucursal
			Repetir
				//Se elige la sucursal
				Escribir "¿De qué sucursal realizará la compra de sus productos?";
				Para t<-1 hasta 4 Hacer
					Escribir t,". Sucursal ", t;
				FinPara
				Leer sucursal;
				//Se inicia el bucle después de elegir la misma sucursal
				Repetir
					//Se elige el producto
					Escribir "¿Que producto deseas comprar? (de la Sucursal ", s,")";
					Para t<-1 hasta 5 Hacer
						Escribir t,". Producto ", t, " con precio de $", producto[t];
					FinPara
					Leer posicionproducto;
					//Se elige la cantidad del producto
					Escribir "¿Qué cantidad del producto ", posicionproducto, " deseas comprar?";
					Leer cantidadproducto;
					//En las condicionales se posicionan los valores y se suman a los productos y sucursales, el costo y la cantidad
					Si x>1 Entonces
						posicionamiento<-((x-1)*20);
						Si sucursal=1 Entonces
							a<-(posicionproducto)+(posicionamiento);
							Para f<-1 Hasta 5 Hacer
								Si posicionproducto=f Entonces
									recaudado[1]<-producto[f]*cantidadproducto+recaudado[1];
								FinSi
							FinPara
						SiNo
							Si sucursal=2 Entonces
								a<-posicionproducto+5+(posicionamiento);
								Para f<-1 Hasta 5 Hacer
									Si posicionproducto=f Entonces
										recaudado[2]<-producto[f]*cantidadproducto+recaudado[2];
									FinSi
								FinPara
							SiNo
								Si sucursal=3 Entonces
									a<-posicionproducto+10+(posicionamiento);
									Para f<-1 Hasta 5 Hacer
										Si posicionproducto=f Entonces
											recaudado[3]<-producto[f]*cantidadproducto+recaudado[3];
										FinSi
									FinPara
								SiNo
									Si sucursal=4 Entonces
										a<-posicionproducto+15+(posicionamiento);
										Para f<-1 Hasta 5 Hacer
											Si posicionproducto=f Entonces
												recaudado[4]<-producto[f]*cantidadproducto+recaudado[4];
											FinSi
										FinPara
									FinSi
								FinSi
							FinSi
						FinSi
					SiNo
							Si sucursal=1 Entonces
								a<-(posicionproducto);
								Para f<-1 Hasta 5 Hacer
									Si posicionproducto=f Entonces
										recaudado[1]<-producto[f]*cantidadproducto+recaudado[1];
									FinSi
								FinPara
							SiNo
								Si sucursal=2 Entonces
									Para f<-1 Hasta 5 Hacer
										Si posicionproducto=f Entonces
											recaudado[2]<-producto[f]*cantidadproducto+recaudado[2];
										FinSi
									FinPara
								SiNo
									Si sucursal=3 Entonces
										a<-posicionproducto+10;
										Para f<-1 Hasta 5 Hacer
											Si posicionproducto=f Entonces
												recaudado[3]<-producto[f]*cantidadproducto+recaudado[3];
											FinSi
										FinPara
									SiNo
										Si sucursal=4 Entonces;
											a<-posicionproducto+15
											Para f<-1 Hasta 5 Hacer
												Si posicionproducto=f Entonces
													recaudado[4]<-producto[f]*cantidadproducto+recaudado[4];
												FinSi
											FinPara
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
						vtotalpc[a]<-cantidadproducto+vtotalpc[a];
						sucursales[sucursal]<-cantidadproducto+sucursales[sucursal];
						//Se pregunta si se quiere agregar otro producto
					Escribir "¿Quieres agregar otro producto de esta sucursal?(Sucursal ", sucursal,")";
					Escribir "1. Si";
					Escribir "2. No";
					Leer resp;
				Hasta Que resp=2
				//Se pregunta si se quiere comprar en otra sucursal
			Escribir "¿Quieres comprar un producto de otra sucursal?";
			Escribir "1. Si";
			Escribir "2. No";
			Leer resp;
		Hasta Que resp=2
	FinPara
	//a
	//g
	//h
	//Se hace un bucle para registrar por cliente cuantos y cuales productos compraron, además de lo gastado en total en ese producto, en cada una de las sucursales
	Para x<-1 Hasta n Hacer
		Escribir "-----------------------";
		Escribir "Cliente ", x, ".";
		Escribir nombrep[x];
		Para sucursal<-1 Hasta 4 Hacer
			Escribir "------SUCURSAL ", sucursal,"------";
			//Bucle para posicionar los productos cuantos y cuales productos compraron, además de lo gastado en total en ese producto, en cada una de las sucursales
			Para posicionproducto<-1 Hasta 5 Hacer
				Si x>1 Entonces
					posicionamiento<-((x-1)*20);
					Si sucursal=1 Entonces
						a<-(posicionproducto)+(posicionamiento);
					SiNo
						Si sucursal=2 Entonces
							a<-posicionproducto+5+(posicionamiento);
						SiNo
							Si sucursal=3 Entonces
								a<-posicionproducto+10+(posicionamiento);
							SiNo
								Si sucursal=4 Entonces
									a<-posicionproducto+15+(posicionamiento);;
								FinSi
							FinSi
						FinSi
					FinSi
				SiNo
					Si sucursal=1 Entonces
						a<-(posicionproducto);
						psucursales[sucursal]<-vtotalpc[a]+psucursales[sucursal];
					SiNo
						Si sucursal=2 Entonces
							a<-posicionproducto+5;
							psucursales[sucursal]<-vtotalpc[a]+psucursales[sucursal];
							Para v<-6 hasta 10 Hacer
								Si v=vtotalpc[a] Entonces
									sucursales[2]<-vtotalpc[a]+sucursales[2];
								FinSi
							FinPara
						SiNo
							Si sucursal=3 Entonces
								a<-posicionproducto+10
								psucursales[sucursal]<-vtotalpc[a]+psucursales[sucursal];
							SiNo
								Si sucursal=4 Entonces
									a<-posicionproducto+15;
									psucursales[sucursal]<-vtotalpc[a]+psucursales[sucursal];
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
				//Se calcula el producto 3 en la sucursal 1 (inciso c)
				Si sucursal=1 y posicionproducto=3 Entonces
					psucursales[3]<-vtotalpc[a]+psucursales[3];
				FinSi
				Escribir "Comprados de: Producto ", posicionproducto," son ", vtotalpc[a]," = $", vtotalpc[a]*(producto[posicionproducto]);
					sucursalt<-(vtotalpc[a]*(producto[posicionproducto]))+sucursalt;
				Para g<-x Hasta x Hacer
					productosc[g]<-vtotalpc[a]+productosc[g];
				FinPara
				//Se suman los gastos de cada producto 
				Para g<-x Hasta x Hacer
					gastos[g]<-(vtotalpc[a]*(producto[posicionproducto]))+gastos[g];
				FinPara
				Para g<-1 Hasta 5 Hacer
					Si posicionproducto=g Entonces
						productos[g]<-vtotalpc[a]+productos[g];
					FinSi
				FinPara
			FinPara
			Escribir "-----------------------";
			Escribir "El total gastado en la sucursal ", sucursal," fue de: $", sucursalt ;
			Escribir "-----------------------";
			sucursalt<-0;
		FinPara
		Escribir "-----------------------";
		//Se imprime el total comprado y gastado por cliente
		Escribir "Total productos comprados por ", nombrep[x], ": ", productosc[x];
		Escribir "Total gastado por ", nombrep[x], ": $", gastos[x];
	FinPara
	Escribir "-----------------------";
	
	//a
	//Se imprime la cantidad total de todos los productos en todas las sucursales
	Para x<-1 hasta 5 Hacer
		Escribir "La cantidad total del Producto ", x, " es ", productos[x];
	FinPara
	//b
	//Se imprime la cantidad de productos en la sucursal 2
	Escribir "La cantidad de productos en la sucursal número 2 es ", sucursales[2];
	//c
	//Se imprime la cantidad de productos 3 en la sucursal 1
	Escribir "La cantidad de productos 3 en la sucursal número 1 es ", psucursales[3];
	//d
	//Se imprime lo total recaudado por la sucursal 1 a 4
	Para x<-1 hasta 4 Hacer
		Escribir "La recaudación total de la sucursal ", x," fue de $", recaudado[x];
	FinPara
	//e
	//Se suma lo recaudado por cada sucursal para tener el total de lo que ganó la empresa
	Para x<-1 hasta 4 Hacer
		totalempresa<-recaudado[x]+totalempresa;
	FinPara
	Escribir "El total recaudado por la empresa fue de $", totalempresa;
	//f
	//Se hacen comparaciones con bucles para conocer cual es la sucursal con mayor recaudación y la menor
	Para x<-1 hasta 4 Hacer
	Si recaudado[x]>recaudadomayor Entonces
		recaudadomayor<-recaudado[x];
	FinSi
	Si recaudadomenor=0 Entonces
		recaudadomenor<-recaudadomayor;
	FinSi
	Si recaudado[x]<recaudadomayor Entonces
		Si recaudado[x]<recaudadomenor Entonces
			recaudadomenor<-recaudado[x];
		FinSi
	FinSi
	FinPara
	Para x<-1 hasta 4 Hacer
	Si recaudado[x]=recaudadomayor Entonces
		recaudadomayor<-x;
	FinSi
	FinPara
	x<-recaudadomayor;
	//Se imprime la sucursal con mayor recaudación
	Escribir "La sucursal de mayor recaudación fue la sucursal ", recaudadomayor, " con $", recaudado[x];

FinAlgoritmo
