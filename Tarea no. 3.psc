Proceso Figuras_compuesta_2
	Definir B, A, C, AT, AR, Area como Real;
	Escribir "Ingrese el valor de la base";
	Leer B;
	Escribir "Ingrese la altura del tri�ngulo y rect�ngulo unidos";
	Leer A;
	Escribir "Ingrese la altura del rect�ngulo";
	Leer C;
	
	AT <- B * ( A - C ) / 2;
	AR <- C * A;
	Area <- AT + AR;
	
	Escribir "El �rea de la parte triangular es: ", AT;
	Escribir "El �rea de la parte rectangular es: ", AR;
	Escribir "El �rea total del terreno es: ", Area;
FinProceso
