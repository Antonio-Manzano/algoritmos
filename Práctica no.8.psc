Algoritmo Operaciones_matematicas
	Repetir                         //Repetir para
		Escribir "Ingresa la clave" //Recibir clave hasta que sea correcta para poder
		Leer cv                     //poder realizar operaciones
		Si(cv="2330188") Entonces 
			Repetir //Repetir para realizar operaciones hasta que ya no lo requiera
			Escribir "¿Qué operación quieres realizar?"
			Escribir "1: Suma"                         //Pedir operacion con 
			Escribir "2: Resta"                        //sistema númerico para
			Escribir "3: Multiplicación"               //seguimiento de operaciones
			Escribir "4: División"                     //fácilmente
			Escribir "5: Salir"
			Leer opera
			Si(opera="5") Entonces //Condicional para salir del algoritmo
				acabar<-"operar"
			SiNo //Si no se activa la condicional procede a pedir números para operación
				Escribir "Ingresa los primeros 2 numeros que deseas operar"
				leer num1
				leer num2
				Si(opera="1") Entonces //Condicional por si recibe el número para "Suma"
					Repetir            //Bucle para sumar numeros mientras se requiera
						Escribir "La suma de ", num1, " y ", num2 " da como resultado " num1+num2
						num1<-num1+num2 //Sumar y declarar a 0 el segundo número para
						num2<-0         //poder sumar otro si se necesita
						Escribir "¿Desea sumar otro número al resultado anterior?(Si/No)"
						Leer operar //Pregunta para activar condicional para sumar más
						Si (operar="Si" o operar="si" o operar="SI" o operar="sI") Entonces
							Escribir "¿Cual?"
							Leer num2
						SiNo        //Si no se activa acaba el bucle para preguntar si
							acabar<-"preend"//desea realizar otra operación
						FinSi
					Hasta Que (acabar="preend")
				FinSi
				Si(opera="2") Entonces //Condicional por si recibe el número para "Resta"
					Repetir             //Bucle para restar numeros mientras se requiera
						Escribir "La resta de ", num1, " y ", num2 " da como resultado " num1-num2
						num1<-num1-num2 //Restar y declarar a 0 el segundo número para
						num2<-0         //poder restar otro si se necesita
						Escribir "¿Desea restar otro número al resultado anterior?(Si/No)"
						Leer operar
						Si (operar="Si" o operar="si" o operar="SI" o operar="sI") Entonces
							Escribir "¿Cual?"
							Leer num2
						SiNo        //Si no se activa acaba el bucle para preguntar si
							acabar<-"preend"//desea realizar otra operación
						FinSi
					Hasta Que (acabar="preend")
				FinSi
				Si(opera="3") Entonces //Condicional por si recibe el número para "Multiplicación"
					Repetir            //Bucle para multiplicar numeros mientras se requiera 
						Escribir "La multiplicación de ", num1, " y ", num2 " da como resultado " num1*num2
						num1<-num1*num2 //Multiplicar y declarar a 0 el segundo número para
						num2<-0         //poder multiplicar otro si se necesita
						Escribir "¿Desea multiplicar otro número al resultado anterior?(Si/No)"
						Leer operar
						Si (operar="Si" o operar="si" o operar="SI" o operar="sI") Entonces
							Escribir "¿Cual?"
							Leer num2
						SiNo        //Si no se activa acaba el bucle para preguntar si
							acabar<-"preend"//desea realizar otra operación
						FinSi
					Hasta Que (acabar="preend")
				FinSi
				Si(opera="4") Entonces //Condicional por si recibe el número para "División"
					Repetir            //Bucle para dividir numeros mientras se requiera  
						Escribir "La división de ", num1, " y ", num2 " da como resultado " num1/num2
						num1<-num1/num2 //Dividir y declarar a 0 el segundo número para
						num2<-0         //poder dividir otro si se necesita
						Escribir "¿Desea dividir otro número al resultado anterior?(Si/No)"
						Leer operar
						Si (operar="Si" o operar="si" o operar="SI" o operar="sI") Entonces
							Escribir "¿Cual?"
							Leer num2
						SiNo        //Si no se activa acaba el bucle para preguntar si
							acabar<-"preend"//desea realizar otra operación
						FinSi
					Hasta Que (acabar="preend")//Cierre de bucle cuando se acabe la 
				FinSi                          //primera fase de operaciones
			FinSi
			Si(opera="1" o opera="2" o opera="3" o opera="4") Entonces //Condicional para
				Escribir "¿Desea realizar otra operación?(Si/No)"      //realizar una nueva
				Leer operax                                             //operación
				Si (operax="Si" o operax="si" o operax="SI" o operax="sI") Entonces
					acabar<-"end" 
				SiNo                      
					acabar<-"operar" //Condicional para finalizar bucle
				FinSi
			FinSi
		Hasta Que (acabar="operar")
		acabar<-"end" //Asignación para salir de bucle principal y finalizar el algoritmo
	SiNo //Condicional por si no se recibe la clave correcta y repetir el ingreso
				Escribir "Error, ingrese la clave correcta"
			FinSi
		Hasta Que (acabar="end")
FinAlgoritmo
