#!/bin/bash

while true; do
    echo "Menú:"
    echo "1. Procesar archivos: Descarga, clasificación, archivo comprimido."
    echo "2. Monitoreo del sistema: Generar reporte del sistema."
    echo "3. Analizador de textos"
    echo "4. Salir"

    read -p "Ingrese el número de la opción deseada: " opcion

    case $opcion in
        1)
            echo "Procesando archivos..."
		./clasificador.sh
            ;;
        2)
            # Lógica para monitoreo del sistema
            echo "Generando reporte del sistema..."
		./monitor.sh
            ;;
        3)
            # Submenú para analizador de textos
            while true; do
                echo "Submenú Analizador de Textos:"
                echo "1. Indicador estadístico de longitud de palabras."
                echo "2. Mostrar palabras palíndromo."
                echo "3. Detectar y listar direcciones de correo."
                echo "4. Volver al menú principal"

                read -p "Ingrese el número de la opción deseada: " subopcion

                case $subopcion in
                    1)
                        # Lógica para estadísticas de longitud de palabras
                        echo "Calculando estadísticas de longitud de palabras..."
			./statswords.sh
                        ;;
                    2)
                        # Lógica para palabras palíndromo
                        echo "Mostrando palabras palíndromo..."
			./palindromos.sh
                        ;;
                    3)
                        # Lógica para detección y listado de direcciones de correo
                        echo "Detectando y listando direcciones de correo..."
			./email.sh
                        ;;
                    4)
                        break  # Salir del submenú
                        ;;
                    *)
                        echo "Opción no válida. Inténtelo de nuevo."
                        ;;
                esac
            done
            ;;
        4)
            echo "Saliendo del programa. ¡Hasta luego!"
            exit 0
            ;;
        *)
            echo "Opción no válida. Inténtelo de nuevo."
            ;;
    esac
done
