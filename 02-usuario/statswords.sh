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
longitud=$(wc -m "$archivo")

#el '[:alnum:]' '[\n*]' lo usamos para que convierta caracteres no alfanumericos en saltos de linea

palabra_corta=$(tr -c '[:alnum:]' '[\n*]' < "$archivo" | grep -v '^$' | sort -n -k2 | tail -n 1)

palabra_larga=$(tr -c '[:alnum:]' '[\n*]' < "$archivo" | grep -v '^$' | sort -n -k2 | head -n 1)

caracteres=$(wc -m < $archivo.txt)
palabras=$(wc -w < $archivo.txt)
promedio=$(( $caracteres / $palabras))

echo "Estadísticas de longitud de palabras:"
echo "Palabra más corta: $palabra_corta"
echo "Palabra más larga: $palabra_larga"
echo "Longitud promedio: $promedio"
