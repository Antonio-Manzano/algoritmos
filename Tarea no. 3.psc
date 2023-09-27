Proceso Figuras_compuesta_2
	Definir B, A, C, AT, AR, Area como Real;
	Escribir "Ingrese el valor de la base";
	Leer B;
	Escribir "Ingrese la altura del triángulo y rectángulo unidos";
	Leer A;
	Escribir "Ingrese la altura del rectángulo";
	Leer C;
	
	AT <- B * ( A - C ) / 2;
	AR <- C * A;
	Area <- AT + AR;
	
	Escribir "El área de la parte triangular es: ", AT;
	Escribir "El área de la parte rectangular es: ", AR;
	Escribir "El área total del terreno es: ", Area;
FinProceso
