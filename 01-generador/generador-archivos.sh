#!/bin/bash
#crear directorio gen-output si no existe
mkdir -p gen-output/

generador-texto() {
	base64 /dev/urandom | head -c 500 > gen-output/file.txt 
	echo "Archivo de texto creado"
}

generador-sonido() {
	ffmpeg -f -y -hide_banner -loglevel error lavfi -i "anoisesrc=a=0.1:c=white:duration=5" gen-output/out.wav
	echo "Archivo de sonido creado"
}

generador-imagen() {
	convert -size 100x100 xc: +noise Random gen-output/noise.png
	echo "Archivo de imagen creado"
}



read -p "Ingrese el numero de operacion del 1 al 3: " numero


case $numero in
	1)
		generador-texto
		;;
	2)
		generador-sonido
		;;
	3)
		generador-imagen
		;;
	*)
		echo "Lea el titulo!"
		;;
esac
