#!/bin/bash

# Verificar argumento de entrada
if [ $# -ne 1 ]; then
    echo "Uso: $0 <archivo_de_texto>"
    exit 1
fi

archivo=$1

# Verificar existencia del archivo
if [ ! -f $archivo ]; then
    echo "El archivo $archivo no existe."
    exit 1
fi

# Estadísticas de longitud de palabras
longitud=$(awk '{ print length }' $archivo)
palabra_corta=$(awk '{ print length, $0 }' $archivo | sort -n | head -n 1 | awk '{ print $2 }')
palabra_larga=$(awk '{ print length, $0 }' $archivo | sort -n | tail -n 1 | awk '{ print $2 }')
promedio=$(awk '{ sum += length } END { print sum/NR }' $archivo)

echo "Estadísticas de longitud de palabras:"
echo "Palabra más corta: $palabra_corta"
echo "Palabra más larga: $palabra_larga"
echo "Longitud promedio: $promedio"
