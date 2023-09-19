Algoritmo ciclo_productos
	Definir respuesta Como Logico
	subtotal<-0;
	iva<-0;
	totalapagar<-0;
	respuesta<-Verdadero
	Escribir "Ingresar el nombre del cliente";
	Leer Nombre
	Mientras (respuesta=Verdadero)
		Escribir "Ingresa el valor del producto";
		leer valor1
		Escribir "Ingresa la cantidad de productos";
		leer cantidad
		subtotal<-(valor1*cantidad)+subtotal;
		Escribir "¿Deseas continuar? Responde verdadero o falso"
		Leer respuesta
	FinMientras
	iva<-subtotal*.16
	totalapagar<-iva+subtotal
	Escribir "El monto del subtotal de " Nombre " es $", subtotal;
	Escribir "El monto del iva de " Nombre " es $", iva;
	Escribir "El monto global de la factura de " Nombre " es $", totalapagar;
FinProceso

	