Proceso Hospital
	Definir sexo, padecimiento, respuesta, repeat Como Caracter;
	Definir edad, fodonto, mhosp, recaudado, recaudadot, hospitalizacion, consulta, radiografia Como Entero;
	sexo<-"0";
	padecimiento<-"0";
	respuesta<-"0";
	repeat<-"0";
	edad<-0;
	fodonto<-0;
	mhosp<-0;
	recaudado<-0;
	recaudadot<-0;
	hospitalizacion<-500;
	consulta<-250;
	radiografia<-350;
	Repetir
		Escribir "�Qu� edad tiene?";
		Leer edad;
		Escribir "�Cu�l es su sexo? (M/F)";
		Leer sexo;
		Escribir "�Est� hospitalizado por algun padecimiento? ( Si / No )";
		Leer respuesta;
		Si ( respuesta = "Si" o respuesta = "si" o respuesta = "SI" o respuesta = "sI" ) Entonces
			recaudado <- recaudado + hospitalizacion;
		FinSi
		Si ( sexo = "M" o sexo = "m" ) Entonces
			Si ( respuesta = "Si" o respuesta = "si" o respuesta = "SI" o respuesta = "sI" ) Entonces
				mhosp <- mhosp + 1;
			FinSi
		FinSi
		Escribir "�Est� siendo hospitalizado por segunda vez? ( Si / No )";
		Leer respuesta;
		Si ( sexo = "M" o sexo = "m" ) y ( respuesta = "Si" o respuesta = "si" o respuesta = "SI" o respuesta = "sI" ) Entonces
			recaudado <- recaudado - ( recaudado * .5 );
		FinSi
		Escribir "�Solicit� una consulta? ( Si / No )";
		Leer respuesta;
		Si ( respuesta = "Si" o respuesta = "si" o respuesta = "SI" o respuesta = "sI" ) Entonces
			recaudado <- recaudado + consulta;
		FinSi
		Escribir "�Solicit� una radiograf�a? ( Si / No )";
		Leer respuesta;
		Si ( respuesta = "Si" o respuesta = "si" o respuesta = "SI" o respuesta = "sI" ) Entonces
			recaudado <- recaudado + radiografia;
		FinSi
		Escribir "�Ha sido atendido en el area de odontolog�a en los ultimos 2 meses? ( Si / No )";
		Leer respuesta;
		Si ( edad <= 12 ) Entonces
			recaudado <- recaudado - ( recaudado * .1 );
			Si ( sexo = "F" o sexo = "f" ) y ( respuesta = "Si" o respuesta = "si" o respuesta = "SI" o respuesta = "sI" ) Entonces
				fodonto <- fodonto + 1;
			FinSi
		FinSi
		Si ( sexo = "F" o sexo = "f" ) y ( edad >= 18 y edad <= 60 ) Entonces
			recaudado <- recaudado - ( recaudado * .2 ); 
			Si ( respuesta = "Si" o respuesta = "si" o respuesta = "SI" o respuesta = "sI" ) Entonces
				fodonto <- fodonto + 1;
			FinSi
		FinSi
		Escribir "�Desea registrar otro paciente? ( Si / No )";
		Leer repeat;
		recaudadot <- recaudado + recaudadot;
	Hasta Que (repeat = "No")
	Escribir fodonto," mujeres han sido atendidas en el area de odontolog�a y han obtenido descuento por consulta";
	Escribir mhosp, " hombres est�n hospitalizados por alg�n padecimiento";
	Escribir "El hospital a recaudado $", recaudadot, " pesos por conceptos de hospitalizaci�n, consultas y radiograf�as";
FinProceso
