#!/bin/bash

generador-texto() {
  base64 /dev/urandom | head -c 500 > file.txt
  echo "Archivo de texto creado"
}
