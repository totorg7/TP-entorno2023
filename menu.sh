#!/bin/bash

echo "1-Clasificador"
echo "2-Monitoreo de sistema"
echo "3-Analizador de textos"
echo "4-Salir"

read -p "Ingrese su opcion: " opcion

case $opcion in
	1)
		echo "Procesando archivos..."
	;;

	2)
		echo "Extrayendo informacion del sistema..."
	;;

	3)
		echo "Analizando...: "
		echo "a-Longitud de palabras"
		echo "b-Palabras palindromes"·
		echo "c-Correos electronicos"
		read -p "Ingrese su opcion(a-c): " analizador

		case $analizador in
			a)
				echo "Midiendo palabras..."
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

	4)
		echo "Saliendo del prorama..."
		exit 0
	;;

	*)
		echo "Numero invalido: ingrese otro"
	;;

esac
