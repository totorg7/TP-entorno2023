#!/bin/bash

# Verificar argumento de entrada
if [ $# -ne 1 ]; then
    echo "Uso: $0 <directorio_de_archivos>"
    exit 1
fi

directorio=$1

# Verificar existencia del directorio
if [ ! -d $directorio ]; then
    echo "El directorio $directorio no existe."
    exit 1
fi

# Crear directorios de salida si no existen
mkdir -p $directorio/img
mkdir -p $directorio/snd
mkdir -p $directorio/txt

# Clasificar archivos por tipo
for archivo in $directorio/*; do
    if [ -f "$archivo" ]; then
        extension="${archivo##*.}"

        case "$extension" in
            "txt")
                mv "$archivo" "$directorio/txt/"
                ;;
            "jpg")
                mv "$archivo" "$directorio/img/"
                ;;
            "wav")
                mv "$archivo" "$directorio/snd/"
                ;;
            *)

                ;;
        esac
    fi
done

# Comprimir archivos clasificados
tar -cf $directorio/outputs.tar.gz -C $directorio img snd txt

echo "Archivos clasificados y comprimidos en $directorio/outputs.tar.gz"
