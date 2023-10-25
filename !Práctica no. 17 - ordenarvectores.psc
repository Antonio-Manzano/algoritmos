Algoritmo sin_titulo
	//con un array almacenar el sueldo mensual de una persona considerando que 2 
	//veces al año tiene incrementos en sus pagos, en julio y en diciembre,
	//en donde julio se le paga un 30% mas y en diciembre el 50%, calcular el sueldo anual de la persona con base a lo siguient
	//si el ingreso anual supera los 50000 pesos pagara un impuesto del 5%
	//si el pago de diciembre es mayor a los 20000 pesos pagará un impuesto decembrino del 2%
	//se pide mostrar el sueldo por mes ordenado de mayor a menor y menor a mayor indicando los impuestos que pagó al final del año
	//mostrar la resta de impuestos
	Dimension smensual[12]
	Dimension imes[12]
	
	imes[1]<-"Enero"
	imes[2]<-"Febrero"
	imes[3]<-"Marzo"
	imes[4]<-"Abril"
	imes[5]<-"Mayo"
	imes[6]<-"Junio"
	imes[7]<-"Julio"
	imes[8]<-"Agosto"
	imes[9]<-"Septiembre"
	imes[10]<-"Octubre"
	imes[11]<-"Noviembre"
	imes[12]<-"Diciembre"
	Escribir "¿Cómo se llama el empleado?";
	Leer nombre;
	Para i=1 Hasta 12 Hacer
		Escribir "¿Cuánto le pagan de sueldo en ", imes[i], "?";
		Leer smensual[i];
	FinPara
	Para i=1 Hasta 12 Hacer
		Si i=7 Entonces
			Escribir "----------------------------------------------";
			Escribir "El pago de Julio original era de " smensual[i];
			smensual[i]<-smensual[i]+(smensual[i]*.3);
			Escribir "Ahora el pago de Julio es $" smensual[i], " debido a que se le aumentó 30%";
			Escribir "----------------------------------------------";
		FinSi
		Si i=12 Entonces
			Escribir "El pago de Diciembre original era de $" smensual[i];
			smensual[i]<-smensual[i]+(smensual[i]*.5);
			Escribir "Ahora el pago de Diciembre es $" smensual[i], " debido a que se le aumentó 50%";
			Escribir "----------------------------------------------";
		FinSi
	FinPara
	Si smensual[12]>20000 Entonces
		Escribir "El pago de Diciembre original era de $" smensual[12];
		smensual[12]<-smensual[12]-(sueldo*.02);
		Escribir "Ahora el pago de Diciembre será $" smensual[12], " debido a que superó los $20000 y se le restó 2%";
	FinSi
	Para i=1 Hasta 12 Hacer
		sanual<-smensual[i]+sanual;
	FinPara
	Si sanual>50000 Entonces
		Escribir "----------------------------------------------";
		Escribir "El pago anual original era de $" sanual;
		sanual<-sanual-(sanual*.05);
		Escribir "Ahora el pago anual es de $" sanual, " debido a que superó los $50000 se le restó %5";
	FinSi
	Para i=1 Hasta 11 Hacer
		Para j=1 Hasta 11 con paso 1 Hacer
			si smensual[j]>smensual[j+1] Entonces
				aux=smensual[j];
				smensual[j]=smensual[j+1];
				smensual[j+1]=aux;
				auxn=imes[j];
				imes[j]=imes[j+1];
				imes[j+1]=auxn;
			FinSi
		FinPara
	FinPara
	Escribir "----------------------------------------------";
	Escribir "A " nombre, " le pagan por mes";
	Escribir "------------------------------"
	Escribir "Escrito de mayor a menor";
	Escribir "------------------------------"
	Para i=12 Hasta 1 Hacer
		Escribir imes[i]," tiene un sueldo de $", smensual[i];
	FinPara
	Escribir "------------------------------"
	Escribir "Escrito de menor a mayor";
	Escribir "------------------------------"
	Para i=1 Hasta 12 Hacer
		Escribir imes[i]," tiene un sueldo de $", smensual[i];
	FinPara
	Escribir "------------------------------";
	Escribir "Pago anual: $" sanual;


	
FinAlgoritmo
