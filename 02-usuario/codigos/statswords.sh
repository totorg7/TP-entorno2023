#!/bin/bash

# verificar argumento
if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo_de_texto>"
    exit 1
fi

archivo=$1

# ver si existe el archivo
if [ ! -f $archivo ]; then
    echo "El archivo $archivo no existe."
    exit 1
fi

# la longitud del texto
longitud=$(wc -m "$archivo")

palabra_corta=""
palabra_larga=""

# Leer palabras del archivo y comparar longitudes
while IFS= read -r palabra; do
    # Si la palabra_corta está vacía o la longitud de la palabra es menor que la longitud de palabra_corta
    if [ -z "$palabra_corta" ] || [ "${#palabra}" -lt "${#palabra_corta}" ]; then
        palabra_corta="$palabra"
    fi

    # Si la longitud de la palabra es mayor que la longitud de palabra_larga
    if [ -z "$palabra_larga" ] || [ "${#palabra}" -gt "${#palabra_larga}" ]; then
        palabra_larga="$palabra"
    fi
done < "$archivo"
caracteres=$(wc -m < $archivo)
palabras=$(wc -w < $archivo)
promedio=$(echo "scale=2; $caracteres / $palabras" | bc)

echo "Estadísticas de longitud de palabras: $longitud"
echo "Palabra más corta: $palabra_corta"
echo "Palabra más larga: $palabra_larga"
echo "Longitud promedio: $promedio"
