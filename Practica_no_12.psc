Algoritmo Practica_no_12
	Definir producto, clave, categoria, descripcion, nombre, domicilio, correo Como Caracter;
	Definir precio, cantidad, telefono, codigopostal Como Real;
	Escribir "Nombre del producto";
	Leer producto;
	Escribir "Clave del producto";
	Leer clave;
	Repetir
		Escribir "Precio del producto";
		Leer precio;
		Si(precio<1) Entonces
			Escribir "Error, escribe el precio correcto";
		FinSi
	Hasta Que (precio>0)
	Escribir "Categor�a del producto";
	Leer categoria;
	Escribir "Descripci�n del producto";
	Leer descripcion;
	Repetir
		Escribir "�Cu�ntos ", producto, " quieres?";
		Leer cantidad;
		Si(cantidad<1) Entonces
			Escribir "Error, escribe una cantidad correcta";
		FinSi
	Hasta Que (cantidad>0)
	Escribir "Nombre del cliente";
	Leer nombre;
	Escribir "Domicilio del cliente";
	Leer domicilio;
	Escribir "Telefono del cliente";
	Leer telefono;
	Escribir "C�digo postal";
	Leer codigopostal;
	Escribir "Correo electr�nico";
	Leer correo;
	Escribir "Producto: ", producto;
	Escribir "Clave del producto: ", clave;
	Escribir "Precio por unidad del producto: ", precio;
	Escribir "Categor�a del producto: ", categoria;
	Escribir "Descripci�n del producto: ", descripcion;
	Escribir "Nombre del cliente: ", nombre;
	Escribir "Domicilio del cliente: ", domicilio;
	Escribir "C�digo postal: ", codigopostal;
	Escribir "Correo electr�nico: ", correo;
	Escribir "La cantidad de productos recibidos por ", nombre, " es de ", cantidad, " ", producto;
	Escribir "El total a pagar de ", nombre, " es de $", precio*cantidad, " pesos.";
	Si ((precio*cantidad) > 4999 y (codigopostal=87000) y (cantidad>5)) Entonces
		Si ((precio*cantidad) < 10001) Entonces
			Escribir "Se ha timbrado la factura con un folio 10";
		SiNo
			Escribir "Se ha timbrado la factura con un folio 20";
		FinSi
	SiNo
		Escribir "No se ha timbrado la factura";
	FinSi
FinAlgoritmo
