Algoritmo Ciclo_formativo_de_grado_superior
	Definir respuesta1 Como l�gico
	Escribir "Responde verdadero o falso dependiendo de tu caso."
	Escribir "�Tienes un t�tulo de bachiller?"
	leer respuesta1
	Si (respuesta1=verdadero) Entonces
		Escribir "De acuerdo, puedes acceder a cursar un ciclo formativo de grado superior"
	SiNo
		Escribir "�Has superado una prueba de acceso?"
		leer respuesta2
		Si (respuesta2=verdadero) Entonces
			Escribir "De acuerdo, puedes acceder a cursar un ciclo formativo de grado superior"
		SiNo
			Escribir "Lamentablemente no puedes acceder a cursar un ciclo formativo de grado superior"
		FinSi
	FinSi
FinAlgoritmo
