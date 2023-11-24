#!/bin/bash

OUTPUT_DIR=outputs
mkdir -p $OUTPUT_DIR
FILENAME="reporte"
DATE=$(date +%F-%T)
OUTPUT_FILE=$OUTPUT_DIR/$FILENAME-$DATE.txt
PROCESOS=$(($(ps -aux | wc -l) -1))


echo "Usuario: $USER" > $OUTPUT_FILE
echo "Uso de CPU: 0%" >> $OUTPUT_FILE
echo "Numero de proceso: $PROCESOS " >> $OUTPUT_FILE
echo "Usuario: $USER" >> $OUTPUT_FILE

