#!/bin/bash

# Definir las rutas de origen y destino
origen1="/IBM/logs/"
origen2="/loghist/"
destino1="/ruta/de/backup/logs/$(date +%Y-%m-%d)/"
destino2="/ruta/de/backup/loghist/$(date +%Y-%m-%d)/"

# Crear las carpetas de destino si no existen
mkdir -p "$destino1"
mkdir -p "$destino2"

# Copiar los archivos de origen al destino
cp -R "$origen1"* "$destino1"
cp -R "$origen2"* "$destino2"

# Imprimir mensaje de finalización
echo "Backup completado exitosamente!"
