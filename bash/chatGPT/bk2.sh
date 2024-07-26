#!/bin/bash

# Definir las rutas de origen y destino
origen1="/IBM/logs/"
origen2="/loghist/"
destino1="/ruta/de/backup/logs/"
destino2="/ruta/de/backup/loghist/"

# Crear las carpetas de destino si no existen
mkdir -p "$destino1"
mkdir -p "$destino2"

# Obtener la fecha actual en formato YYYY-MM-DD
fecha=$(date +%Y-%m-%d)

# Realizar la copia de seguridad utilizando rsync
rsync -avz --delete "$origen1" "$destino1$fecha/"
rsync -avz --delete "$origen2" "$destino2$fecha/"

# Imprimir mensaje de finalización
echo "Backup completado exitosamente!"
