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

# Palabras palíndromo
palindromos=palindromos=$(grep -o -i -E '\b(\w+)\b' "$archivo" | while read -r word; do l=$(echo "$word" | tr '[:upper:]' '[:lower:]'); [ "$l" == "$(echo "$l" | rev)" ] && echo "$word"; done | sort -u)

echo "Palabras palíndromo:"
echo "$palindromos"
