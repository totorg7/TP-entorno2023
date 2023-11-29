
#!/bin/bash

OUTPUT_DIR=outputs
mkdir -p $OUTPUT_DIR
FILENAME="reporte"
DATE=$(date +%F-%T)
OUTPUT_FILE=$OUTPUT_DIR/$FILENAME-$DATE.txt
PROCESOS=$(($(ps -aux | wc -l) -1))
USO_CPU=$(ps -aux | grep -v USER | tr -s " " | cut -d " " -f 3 | sum | cut -d " " -f 1)


echo "Usuario: $USER" > $OUTPUT_FILE
echo "Uso de CPU: %$USO_CPU" >> $OUTPUT_FILE
echo "Numero de proceso: $PROCESOS " >> $OUTPUT_FILE
echo "Usuario: $USER" >> $OUTPUT_FILE

