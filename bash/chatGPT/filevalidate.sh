#!/bin/bash

# Ruta completa del directorio
directory="/loghist"

# Iterar sobre todos los archivos en el directorio
for filename in "$directory"/*; do
    # Verificar si el archivo existe
    if [[ -f "$filename" ]]; then
        # Extraer partes del nombre del archivo
        nombre=$(basename "$filename")
        prefix="SystemOut"
        date_part=$(basename "$filename" | cut -d'_' -f2)
        time_part=$(basename "$filename" | cut -d'_' -f3)
        extension=".log"

        #echo "$date_part"
        #echo "$time_part"

        # Validar la fecha y hora
        if [[ "$date_part" =~ ^[0-9]{2}\.[0-9]{2}\.[0-9]{2}$ ]] && [[ "$time_part" =~ ^[0-9]{2}\.[0-9]{2}\.[0-9]{2}\.log ]]; then
            echo "El archivo $nombre cumple con el formato esperado."
        else
            echo "El archivo $nombre no cumple con el formato esperado."
        fi
    fi
done

