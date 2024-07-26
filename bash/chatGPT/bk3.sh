#!/bin/bash

# Definir las rutas de origen y destino
origen="/IBM/logs/"
destino="/ruta/de/backup/loghist/"

# Crear la carpeta de destino si no existe
mkdir -p "$destino"

# Obtener la fecha actual en formato YYYY-MM-DD
fecha=$(date +%Y-%m-%d)

# Realizar la copia de seguridad utilizando rsync
rsync -avz --delete "$origen" "$destino$fecha/"

# Imprimir mensaje de finalización
echo "Backup completado exitosamente!"
