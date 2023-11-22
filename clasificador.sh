#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "Uso: $0 <ruta>"
	exit 1
fi

ruta="$1"

if [ ! -d "$ruta" ]; then
	echo "La ruta proporcionada no es valida"
	exit 1
fi


clasificador_archivo() {
	archivo="$1"
	tipo_archivo=$(file -b --mime-type "$archivo" | cut -d'/' -f1)
	extension_archivo="${archivo##*.}"
	nuevo_nombre="${tipo_archivo,,}${tipo_archivo}_${RANDOM}.$extension_archivo"
	

	case $tipo_archivo in
		"image")
			carpeta_destino="img"
			;;
		"audio")
			carpeta_destino="aud"
			;;	
		"text")
			carpeta_destino="txt"
			;;
		*)
			carpeta_destino="otros"
			;;
	esac

	

	if [ ! -d "outputs/$carpeta_destino" ]; then
		mkdir -p "outputs/$carpeta_destino"
	fi

	
	mv "$archivo" "outputs/$carpeta_destino/$nuevo_nombre"
}



for archivo_actual in "$ruta"/*; do
	if [ -f "$archivo_actual" ]; then
		clasificador_archivo "$archivo_actual"
		echo "Archivo clasificado: $archivo_actual"
	fi

done


echo "Proceso completado"
			
