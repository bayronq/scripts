#!/bin/bash
#Pruebas para mover archivos SystemOut compresos
#ordenandolos por ano mes dia
#

# Directorio de búsqueda
origen="/loghist/FF8" # Reemplaza con la ruta al directorio donde deseas buscar
patron="^SystemOut_[0-9]+\.[0-9]+\.[0-9]+"
patron2="^SystemErr_[0-9]+\.[0-9]+\.[0-9]+_[0-9]+\.[0-9]+\.[0-9]+\.log\.zip$"

directorios=$(ls $origen)
for directorio in $directorios; do
	ruta_completa="$origen"/$directorio
	log="$ruta_completa"/archivosmovidos.log		#Archivo de log
	for archivo in "$ruta_completa"/*.zip; do
		#Obtener nombre de archivo
		nombre_archivo=$(basename "$archivo")
		if [[ $nombre_archivo =~ $patron|$patron2 ]]; then
			echo "Este si archivo $nombre_archivo si cumple con el formato"
			yy=$(echo $nombre_archivo | cut -c 11-12)
			anio="20"$yy
			mes=$(echo $nombre_archivo | cut -c 14-15)
			dia=$(echo $nombre_archivo | cut -c 17-18)

			#Crear una carpeta con la fecha de creación si no existe
			destino="$ruta_completa/$anio/$mes/$dia"
			if [ ! -d "$destino" ]; then
				mkdir -p "$destino"
			fi


			echo $(date +%D" "%T) "Se traslado el archivo: $nombre_archivo a la ruta $destino"
			#guarda log
			echo  $(date +%D" "%T) "Se traslado el archivo: $nombre_archivo a la ruta $destino" >> $log
			#Mueve el archivo al directorio correspondiente
			mv "$ruta_completa"/$nombre_archivo "$destino"/$nombre_archivo

			else
			echo "el archivo $nombre_archivo no cumple formato"
		fi

	done

done
echo "La organización de logs se realizó con éxito.."
