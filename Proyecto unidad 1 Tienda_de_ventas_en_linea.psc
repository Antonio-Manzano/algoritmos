Algoritmo Tienda_de_ventas_en_linea
	Definir recaudadog, recaudadopc, recaupm, recaupf, recaumdepor, respuesta, producto, cliente, cantidad Como Real;
	Definir respuestac, sexo como Caracter;
	Definir depormasc, deporfem, zapmasc, zapfem, acces como Entero;
	Definir cmsdepm, tenism, tachonesm, calcetasm, rodillerasm Como Entero;
	Definir blsdepf, tenisf, tachonesf, calcetasf, rodillerasf Como Entero;
	Definir zapvestirc, mocasinc, botasc, teniscc, zapatoctc Como Entero; 
	Definir zapvestird, botaspasd, sandaliad, teniscd, taconesc Como Entero;
	Definir cajorgz, repver, ganchosr, exhropa, rackpg Como Entero;
	recaudadog<-0; //total recaudado general
	recaudadopc<-0; //control de venta por cada cliente
	respuesta<-0; //variable para responder preguntas
	producto<-0;
	cliente<-1; 
	recaupm<-0; 
	recaupf<-0; 
	cantidad<-0;
	sexo<-"0";
	respuestac<-"0";
	//
	depormasc<-0;
	deporfem<-0;
	zapmasc<-0;
	zapfem<-0;
	acces<-0;
	//
	cmsdepm<-50;
	tenism<-50;
	tachonesm<-50;
	calcetasm<-50;
	rodillerasm<-50;
	//
	blsdepf<-50;
	tenisf<-50;
	tachonesf<-50;
	calcetasf<-50;
	rodillerasf<-50;
	//
	zapvestirc<-50;
	mocasinc<-50;
	botasc<-50;
	teniscc<-50;
	zapatoctc<-50;
	//
	zapvestird<-50;
	botaspasd<-50;
	sandaliad<- 50;
	teniscd<-50;
	taconesc<-50;
	//
	cajorgz<-50;
	repver<-50;
	ganchosr<-50;
	exhropa<-50;
	rackpg<-50;
	
	Repetir //Bucle para a�adir otro cliente al registro de ventas de la tienda
		Escribir "Ingresando cliente n�mero ", cliente; //Imprime un texto junto con la variable que identifica el n�mero del cliente
		Repetir 										//Bucle que se activa si escribe mal el sexo del cliente
		Escribir "�Cu�l es su sexo? (M/F)";			//Imprime y pregunta por el sexo
		Leer sexo;										//Lee la variable del sexo
		Si (sexo="M" o sexo="m" o sexo="F" o sexo="f") Entonces //Condicional que identifica si escribi� bien el sexo y manda mensaje de error si no es el caso
			Escribir "Escriba un n�mero dependiendo de su selecci�n";
		SiNo
			Escribir "Error, escriba M o F";
		FinSi
		Hasta Que (sexo="M" o sexo="m" o sexo="F" o sexo="f") //Fin del bucle que identifica si escribi� bien el sexo o no
		Repetir //Bucle para volver al men� de selecci�n de lineas de compra y comprar otro producto
		Repetir //Bucle para conocer la linea en la que se compra el producto				
		Escribir "�De que linea realiza la compra?";
		Escribir "1. Deporte Caballero";
		Escribir "2. Deporte Dama";						//Aqu� se imprimen las 5 lineas de producto 
		Escribir "3. Zapato Caballero";					
		Escribir "4. Zapato Dama";
		Escribir "5. Accesorios";
		Leer respuesta;		//Se lee la linea en la que se hace la compra
		Si (respuesta<1 o respuesta>5) Entonces //Hace que el bucle se repita para que ingrese una linea correcta
			Escribir "Error, selecciona bien la linea donde se realiza la compra";
		FinSi
		Hasta Que (respuesta>0 y respuesta<6) //El bucle termina si pone una linea adecuada
		Si (respuesta=1) Entonces //Condicional que se activa dependiendo de la variable que se ley� en la variable "respuesta"
			Repetir //Bucle para volver a la misma l�nea a comprar otro producto
			Escribir "Ingrese el producto de la linea Deporte Caballero";
			Escribir "1. Camisa Deportiva";
			Escribir "2. Tenis";
			Escribir "3. Tachones";				//Aqu� se imprimen las opciones de los 5 productos
			Escribir "4. Calcetas";
			Escribir "5. Rodilleras";
			Leer producto; //Se lee la el producto que solicita el cliente
			Si (producto=1) Entonces
				Escribir "�A�n tenemos ", cmsdepm, " camisas deportivas disponibles!"; //Usa la variable para definir el stock que a�n se tiene
				Escribir "�Cu�ntos camisas deportivas quieres?"; //Se imprime la pregunta de cu�ntos productos de este requiere
				Leer cantidad; //Se lee la cantidad que solicita
				Si (cantidad <= cmsdepm) Entonces //Condicional que se activa si existe la cantidad de productos que solicita
					cmsdepm<-cmsdepm-cantidad;	  //Se asigna a la variable del producto la resta de la cantidad que se solicit�	
					recaudadopc<-recaudadopc+(300*cantidad); //Se asigna el gasto hecho a la cuenta del cliente actual
					depormasc<-depormasc+(300*cantidad); //Se asigna la ganancia a la linea actual
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo"; //Si la cantidad le�da de lo que solicita es mayor a los productos
				FinSi																		//que se tienen, no hace nada y env�a a la pregunta de si quiere
			FinSi																			//hacer otra compra de esta l�nea
			Si (producto=2) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
				Escribir "�A�n tenemos ", tenism, " tenis disponibles!"; 
				Escribir "�Cu�ntos tenis quieres?"; 
				Leer cantidad; 
				Si (cantidad <= tenism) Entonces 
					tenism<-tenism-cantidad;	
					recaudadopc<-recaudadopc+(800*cantidad); 
					depormasc<-depormasc+(800*cantidad);
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo"; 
				FinSi																		
			FinSi 													
			Si (producto=3) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
				Escribir "�A�n tenemos ", tachonesm, " tachones disponibles!";  
				Escribir "�Cu�ntos tachones quieres?";
				Leer cantidad; 
				Si (cantidad <= tachonesm) Entonces 
					tachonesm<-tachonesm-cantidad;  
					recaudadopc<-recaudadopc+(700*cantidad);
					depormasc<-depormasc+(700*cantidad); 
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo";
				FinSi	
			FinSi																			
			Si (producto=4) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
				Escribir "�A�n tenemos ", calcetasm, " calcetas disponibles!";
				Escribir "�Cu�ntos calcetas quieres?";
				Leer cantidad;
				Si (cantidad <= calcetasm) Entonces 
					calcetasm<-calcetasm-cantidad; 
					recaudadopc<-recaudadopc+(60*cantidad); 
					depormasc<-depormasc+(60*cantidad);
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo";
				FinSi
			FinSi 
			Si (producto=5) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
				Escribir "�A�n tenemos ", rodillerasm, " rodilleras disponibles!";
				Escribir "�Cu�ntos rodilleras quieres?";
				Leer cantidad;
				Si (cantidad <= rodillerasm) Entonces
					rodillerasm<-rodillerasm-cantidad;
					recaudadopc<-recaudadopc+(100*cantidad);
					depormasc<-depormasc+(100*cantidad);
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo";
				FinSi
			FinSi
			Escribir "�Desea comprar algo m�s de esta l�nea? Escribe (Si/No)"; //Imprime una pregunta por si queremos alg�n otro producto de esta l�nea
			Leer respuestac; //Y procede a leer la respuesta
		Hasta Que (respuestac="No" o respuestac="no" o respuestac="NO" o respuestac="nO")
	FinSi
		Si (respuesta=2) Entonces //Condicional para saber que linea eligi�
			Repetir //Bucle para poder elegir alg�n producto m�s de la linea Deporte Dama
			Escribir "Ingrese el producto de la linea Deporte Dama";
			Escribir "1. Blusa Deportiva";
			Escribir "2. Tenis";
			Escribir "3. Tachones";
			Escribir "4. Calcetas";
			Escribir "5. Rodilleras";
			Leer producto;
			Si (producto=1) Entonces
				Escribir "�A�n tenemos ", blsdepf, " blusas deportivas disponibles!"; //Usa la variable para definir el stock que a�n se tiene
				Escribir "�Cu�ntos blusas deportivas quieres?"; //Se imprime la pregunta de cu�ntos productos de este requiere
				Leer cantidad; //Se lee la cantidad que solicita
				Si (cantidad <= blsdepf) Entonces //Condicional que se activa si existe la cantidad de productos que solicita
					blsdepf<-blsdepf-cantidad; //Se asigna a la variable del producto la resta de la cantidad que se solicit�	
					recaudadopc<-recaudadopc+(300*cantidad); //Se asigna el gasto hecho a la cuenta del cliente actual
					deporfem<-deporfem+(300*cantidad); //Se asigna la ganancia a la linea actual
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo"; //Si la cantidad le�da de lo que solicita es mayor a los productos
				FinSi																		//que se tienen, no hace nada y env�a a la pregunta de si quiere
			FinSi																			//hacer otra compra de esta l�nea
			Si (producto=2) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
				Escribir "�A�n tenemos ", tenisf, " tenis disponibles!";
				Escribir "�Cu�ntos tenis quieres?";
				Leer cantidad;
				Si (cantidad <= tenisf) Entonces
					tenisf<-tenisf-cantidad;
					recaudadopc<-recaudadopc+(500*cantidad);
					deporfem<-deporfem+(500*cantidad);
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo";
				FinSi
			FinSi
			Si (producto=3) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
				Escribir "�A�n tenemos ", tachonesf, " tachones disponibles!";
				Escribir "�Cuantos tachones quieres?";
				Leer cantidad;
				Si (cantidad <= tachonesf) Entonces
					tachonesf<-tachonesf-cantidad;
					recaudadopc<-recaudadopc+(700*cantidad);
					deporfem<-deporfem+(700*cantidad);
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo";
				FinSi
			FinSi
			Si (producto=4) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
				Escribir "�A�n tenemos ", calcetasf, " calcetas disponibles!";
				Escribir "�Cuantas calcetas quieres?";
				Leer cantidad;
				Si (cantidad <= calcetasf) Entonces
					calcetasf<-calcetasf-cantidad;
					recaudadopc<-recaudadopc+(100*cantidad);
					deporfem<-deporfem+(100*cantidad);
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo";
				FinSi
			FinSi
			Si (producto=5) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
				Escribir "�A�n tenemos ", rodillerasf, " rodilleras disponibles!";
				Escribir "�Cu�ntos rodilleras quieres?";
				Leer cantidad;
				Si (cantidad <= rodillerasf) Entonces
					rodillerasf<-rodillerasf-cantidad;
					recaudadopc<-recaudadopc+(100*cantidad);
					deporfem<-deporfem+(100*cantidad);
				SiNo
					Escribir "No hay suficientes productos de este tipo, haga otro encargo";
				FinSi
			FinSi
			Escribir "�Desea comprar algo m�s de esta l�nea? Escribe (Si/No)"; //Imprime una pregunta por si queremos alg�n otro producto de esta l�nea
			Leer respuestac; //Y procede a leer la respuesta
		Hasta Que (respuestac="No" o respuestac="no" o respuestac="NO" o respuestac="nO")
		FinSi
		Si (respuesta=3) Entonces //Condicional para saber que linea eligi�
			Repetir //Bucle para poder elegir alg�n producto m�s de la linea Zapato Caballero
				Escribir "Ingrese el producto de la linea Zapato Caballero";
				Escribir "1. Zapatos de vestir";
				Escribir "2. Mocasines";
				Escribir "3. Botas";
				Escribir "4. Tenis casuales";
				Escribir "5. Zapato con tac�n";
				Leer producto;
				Si (producto=1) Entonces 
					Escribir "�A�n tenemos ", zapvestirc, " zapatos de vestir disponibles!"; //Usa la variable para definir el stock que a�n se tiene
					Escribir "�Cu�ntos zapatos de vestir quieres?"; //Se imprime la pregunta de cu�ntos productos de este requiere
					Leer cantidad; //Se lee la cantidad que solicita
					Si (cantidad <= zapvestirc) Entonces //Condicional que se activa si existe la cantidad de productos que solicita
						zapvestirc<-zapvestirc-cantidad; //Se asigna a la variable del producto la resta de la cantidad que se solicit�	
						recaudadopc<-recaudadopc+(600*cantidad); //Se asigna el gasto hecho a la cuenta del cliente actual
						zapmasc<-zapmasc+(600*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=2) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", mocasinc, " mocasines disponibles!";
					Escribir "�Cu�ntos mocasines quieres?";
					Leer cantidad;
					Si (cantidad <= mocasinc) Entonces
						mocasinc<-mocasinc-cantidad;
						recaudadopc<-recaudadopc+(800*cantidad);
						zapmasc<-zapmasc+(800*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=3) Entonces
					Escribir "�A�n tenemos ", botasc, " botas disponibles!";
					Escribir "�Cu�ntos botas quieres?";
					Leer cantidad;
					Si (cantidad <= botasc) Entonces 
						botasc<-botasc-cantidad;
						recaudadopc<-recaudadopc+(1300*cantidad);
						zapmasc<-zapmasc+(1300*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=4) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", teniscc, " tenis casuales disponibles!";
					Escribir "�Cu�ntos tenis casuales quieres?";
					Leer cantidad;
					Si (cantidad <= teniscc) Entonces
						teniscc<-teniscc-cantidad;
						recaudadopc<-recaudadopc+(700*cantidad);
						zapmasc<-zapmasc+(700*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=5) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", zapatoctc, " zapatos con tac�n disponibles!";
					Escribir "�Cu�ntos zapatos con tac�n quieres?";
					Leer cantidad;
					Si (cantidad <= zapatoctc) Entonces
						zapatoctc<-zapatoctc-cantidad;
						recaudadopc<-recaudadopc+(700*cantidad);
						zapmasc<-zapmasc+(700*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Escribir "�Desea comprar algo m�s de esta l�nea? Escribe (Si/No)"; //Imprime una pregunta por si queremos alg�n otro producto de esta l�nea
				Leer respuestac; //Y procede a leer la respuesta
			Hasta Que (respuestac="No" o respuestac="no" o respuestac="NO" o respuestac="nO")
		FinSi
		Si (respuesta=4) Entonces	//Condicional para saber que linea eligi�
			Repetir//Bucle para poder elegir alg�n producto m�s de la linea Zapato Caballero
				Escribir "Ingrese el producto de la linea Zapato Caballero";
				Escribir "1. Zapatos de vestir";
				Escribir "2. Botas pascuales";
				Escribir "3. Sandalias";
				Escribir "4. Tenis casuales";
				Escribir "5. Tacones";
				Leer producto;
				Si (producto=1) Entonces
					Escribir "�A�n tenemos ", zapvestird, " zapatos de vestir disponibles!"; //Usa la variable para definir el stock que a�n se tiene
					Escribir "�Cu�ntos zapatos de vestir quieres?"; //Se imprime la pregunta de cu�ntos productos de este requiere
					Leer cantidad; //Se lee la cantidad que solicita
					Si (cantidad <= zapvestird) Entonces //Condicional que se activa si existe la cantidad de productos que solicita
						zapvestird<-zapvestird-cantidad; //Se asigna a la variable del producto la resta de la cantidad que se solicit�	
						recaudadopc<-recaudadopc+(550*cantidad); //Se asigna el gasto hecho a la cuenta del cliente actual
						zapfem<-zapfem+(550*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=2) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", botaspasd, " botas pascuales disponibles!";
					Escribir "�Cu�ntas botas pascuales quieres?";
					Leer cantidad;
					Si (cantidad <= botaspasd) Entonces
						botaspasd<-botaspasd-cantidad;
						recaudadopc<-recaudadopc+(750*cantidad);
						zapfem<-zapfem+(750*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=3) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", sandaliad, " sandalias disponibles!";
					Escribir "�Cu�ntos sandalias quieres?";
					Leer cantidad;
					Si (cantidad <= sandaliad) Entonces
						sandaliad<-sandaliad-cantidad;
						recaudadopc<-recaudadopc+(600*cantidad);
						zapfem<-zapfem+(600*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=4) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", teniscd, " tenis casuales disponibles!";
					Escribir "�Cu�ntos tenis casuales quieres?";
					Leer cantidad;
					Si (cantidad <= teniscd) Entonces
						teniscd<-teniscd-cantidad;
						recaudadopc<-recaudadopc+(850*cantidad);
						zapfem<-zapfem+(850*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=5) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", taconesc, " tacones para ropa disponibles!";
					Escribir "�Cu�ntos tacones quieres?";
					Leer cantidad;
					Si (cantidad <= taconesc) Entonces
						taconesc<-taconesc-cantidad;
						recaudadopc<-recaudadopc+(900*cantidad);
						zapfem<-zapfem+(900*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Escribir "�Desea comprar algo m�s de esta l�nea? Escribe (Si/No)"; //Imprime una pregunta por si queremos alg�n otro producto de esta l�nea
				Leer respuestac; //Y procede a leer la respuesta
			Hasta Que (respuestac="No" o respuestac="no" o respuestac="NO" o respuestac="nO")
		FinSi
		Si (respuesta=5) Entonces //Condicional para saber que linea eligi�
			Repetir//Bucle para poder elegir alg�n producto m�s de la linea Accesorios
				Escribir "Ingrese el producto de la linea Accesorios";
				Escribir "1. Cajas organizadoras para zapatos";
				Escribir "2. Repisa vertical para zapatos";
				Escribir "3. Ganchos para ropa";
				Escribir "4. Exhibidor para ropa";
				Escribir "5. Rack para ganchos";
				Leer producto;
				Si (producto=1) Entonces
					Escribir "�A�n tenemos ", cajorgz, " cajas organizadoras para zapatos disponibles!"; //Usa la variable para definir el stock que a�n se tiene
					Escribir "�Cu�ntos cajas organizadoras para zapatos quieres?"; //Se imprime la pregunta de cu�ntos productos de este requiere
					Leer cantidad; //Se lee la cantidad que solicita
					Si (cantidad <= cajorgz) Entonces //Condicional que se activa si existe la cantidad de productos que solicita
						cajorgz<-cajorgz-cantidad; //Se asigna a la variable del producto la resta de la cantidad que se solicit�	
						recaudadopc<-recaudadopc+(550*cantidad); //Se asigna el gasto hecho a la cuenta del cliente actual
						acces<-acces+(550*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=2) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", repver, " repisas verticales disponibles!";
					Escribir "�Cu�ntas repisas verticales para zapatos quieres?";
					Leer cantidad;
					Si (cantidad <= repver) Entonces
						repver<-repver-cantidad;
						recaudadopc<-recaudadopc+(750*cantidad);
						acces<-acces+(550*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=3) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", ganchosr, " ganchos para ropa disponibles!";
					Escribir "�Cuantos ganchos para ropa quieres?";
					Leer cantidad;
					Si (cantidad <= ganchosr) Entonces
						ganchosr<-ganchosr-cantidad;
						recaudadopc<-recaudadopc+(600*cantidad);
						acces<-acces+(600*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=4) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", exhropa, " exhibidores de ropa disponibles!";
					Escribir "�Cuantos exhibidores de ropa quieres?";
					Leer cantidad;
					Si (cantidad <= exhropa) Entonces
						exhropa<-exhropa-cantidad;
						recaudadopc<-recaudadopc+(850*cantidad);
						acces<-acces+(850*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Si (producto=5) Entonces //Realiza lo mismo que la anterior condicional solo que con algunas variables diferentes
					Escribir "�A�n tenemos ", rackpg, " rack para ganchos disponibles!";
					Escribir "�Cuantos rack para ganchos quieres?";
					Leer cantidad;
					Si (cantidad <= rackpg) Entonces
						rackpg<-rackpg-cantidad;
						recaudadopc<-recaudadopc+(900*cantidad);
						acces<-acces+(900*cantidad);
					SiNo
						Escribir "No hay suficientes productos de este tipo, haga otro encargo";
					FinSi
				FinSi
				Escribir "�Desea comprar algo m�s de esta l�nea?";
				Leer respuestac;
			Hasta Que (respuestac="No" o respuestac="no" o respuestac="NO" o respuestac="nO")
		FinSi
		Escribir "�Desea comprar algo m�s de esta l�nea? Escribe (Si/No)"; //Imprime una pregunta por si queremos alg�n otro producto de esta l�nea
		Leer respuestac; //Y procede a leer la respuesta
	Hasta Que (respuestac="No" o respuestac="no" o respuestac="NO" o respuestac="nO")
	Si (sexo="M"o sexo="m") Entonces
		recaupm<-recaudadopc+recaupm; //Se asigna la cantidad de gastos dependiendo del sexo
	SiNo
		Si (sexo="F" o sexo="f") Entonces
			recaupf<-recaudadopc+recaupf;
		FinSi
	FinSi
	recaudadog<-recaupm+recaupf;
	Escribir "�Se a�adir� otro cliente? Escribe (Si/No)";//Se pregunta sobre si querr� a�adir otro cliente, si dice que si, se repetir� el bucle
	Leer respuestac;
	Escribir "El cliente n�mero ", cliente, " ha gastado un total de $", recaudadopc, " pesos.";
	Si (respuestac="Si" o respuestac="si" o respuestac="SI" o respuestac="sI") Entonces
		cliente<-cliente+1; //Cada que inicie de nuevo el bucle para a�adir a otro cliente se sume
	FinSi
	recaudadopc<-0;
Hasta Que (respuestac="No" o respuestac="no" o respuestac="NO" o respuestac="nO")
Escribir "";
Escribir "La tienda tiene ", cliente, " clientes."; //Se imprime la cantidad de clientes
Escribir "La tienda recaud� $", depormasc," de ropa masculina deportiva."; //Se imprime lo recaudado total de la venta de ropa masculina
Escribir "Se recaud� $", recaupm, " de parte del sexo Masculino."; //Se imprime lo recaudado de de ventas de parte del sexo Masculino
Escribir "Se recaud� $", recaupf, " de parte del sexo Femenino."; //Se imprime lo recaudado de ventas de parte del sexo Masculino
Escribir "Se recaud� $", recaudadog, " de manera general."; //Se imprime lo recaudado de todas las ventas
FinAlgoritmo
