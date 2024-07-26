#!/bin/bash

# Directorio en el que se buscarán los archivos .log
directorio="/mnt/d/Logs/logsMoba"

# Utiliza el comando find para buscar todos los archivos .log en el directorio y sus subdirectorios
archivos_log=$(find $directorio -type f -name "*.log")

# Imprime la ruta de cada archivo .log encontrado
for archivo in $archivos_log
do
  echo $archivo
done

