#!/bin/bash

OUTPUT_DIR=outputs
mkdir -p $OUTPUT_DIR
FILENAME="reporte"
DATE=$(date +%F-%T)
OUTPUT_FILE=$OUTPUT_DIR/$FILENAME-$DATE.txt
PROCESOS=$(($(ps -aux | wc -l) -1))
USO_CPU=$(top -b -n 1 | grep '%Cpu(s)' | cut -d " " -f 3)
USO_RAM=$(top -b -n 1 | grep 'MiB Mem')
ESPACIO_DISC=$(df -T -h | grep 'ext4' | tr -s " " | cut -d " " -f 5)


echo "Usuario: $USER" > $OUTPUT_FILE
echo "Uso de CPU: %$USO_CPU" >> $OUTPUT_FILE
echo "Numero de proceso: $PROCESOS " >> $OUTPUT_FILE
echo "Uso de RAM: %$USO_RAM" >> $OUTPUT_FILE
echo "Uso de disco duro: %$ESPACIO_DISC" >> $OUTPUT_FILE

cat "$(ls -t outputs/reporte-* | head -n 1)" 
