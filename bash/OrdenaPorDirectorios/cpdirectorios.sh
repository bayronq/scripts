#!/bin/bash
#Directorio Origen archivos
origen="/loghist/FF8/AlertC01"

#Directorio Destino
destino="$origen"

#Crear el directorio de respaldo si no existe
#if [ ! -d "$respaldo" ]; then
# mkdir -p "$respaldo"
#fi

for archivo in "$origen"/*.log; do
	#Obtener la fecha de creación del archivo en formato YYYYMMDD
	fecha=$(date -d @$(stat -c %Y "$archivo") +%Y%m%d)

	# Obtener el año, mes y día de la fecha de creación
	anio="${fecha:0:4}"
	mes="${fecha:4:2}"
	dia="${fecha:6:2}"

	#Crear una carpeta con la fecha de creación si no existe
	dir_destino="$destino/$anio/$mes/$dia"
	if [ ! -d "$dir_destino" ]; then
		mkdir -p "$dir_destino"
	fi

	#Obtener nombre de archivo
	nombre_archivo=$(basename "$archivo")

	#Copiar el archivo al directorio respaldo correspondiente
	rsync -ar --partial --progress "$archivo" "$dir_destino/$nombre_archivo"
done

echo "Respaldo completado en $destino"
