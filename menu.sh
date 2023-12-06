#!/bin/bash

echo "1-Generador"
echo "2-Clasificador"
echo "3-Monitoreo de sistema"
echo "4-Analizador de textos"
echo "5-Salir"

read -p "Ingrese su opcion: " opcion

case $opcion in
	1)
		echo "Procesando archivos..."
		echo "1-Generador de texto"
		echo "2-Generador de sonidos"
		echo "3-Generador de imagenes"
		./generador-archivos.sh
	;;

	2)
		echo "Clasificando archivos..."
		./clasificador.sh

	;;

	3)
		echo "Extrayendo informacion del sistema..."
		./monitor.sh
	;;

	4)
		echo "Analizando...: "
		echo "a-Longitud de palabras"
		echo "b-Palabras palindromes"·
		echo "c-Correos electronicos"
		read -p "Ingrese su opcion(a-c): " analizador

		case $analizador in
			a)
				echo "Midiendo palabras..."
				./largo-p.sh
			;;

                       	b)
                                echo "Probando palabras..."
			;;

                       	c)
                                echo "Observando correos..."
			;;

			*)
				echo "Ingrese una opcion válida"
			;;
		esac
	;;

	5)
		echo "Saliendo del programa..."
		exit 0
	;;

	*)
		echo "Numero invalido: ingrese otro"
	;;

esac
