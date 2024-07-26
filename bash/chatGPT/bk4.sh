#!/bin/bash

# Definir las rutas de origen y destino
origen="/home/bayronq/Repo/mydotfiles/"
destino="/home/bayronq/Repo/mydotfiles-bk/"

# Crear la carpeta de destino si no existe
mkdir -p "$destino"

# Obtener la fecha actual en formato YYYY-MM-DD
fecha=$(date +%Y-%m-%d)

# Obtener la fecha de creación de los archivos en la carpeta de origen
fechas=$(find "$origen" -type f -printf "%TY-%Tm-%Td\n" | sort | uniq)

# Crear una carpeta de destino para cada fecha de creación encontrada
for f in $fechas; do
	mkdir -p "$destino$f"
	rsync -avz --delete "$origen" "$destino$f/" --include="*/" --include="*.$f" --exclude="*"
done

# Imprimir mensaje de finalización
echo "Backup completado exitosamente!"
