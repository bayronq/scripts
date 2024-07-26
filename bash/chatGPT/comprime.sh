#!/bin/bash

# Directorio origen donde buscar los archivos .log de manera recursiva
directorio_origen="/home/bayronq"

# Buscar archivos .log que coincidan con el patrón
archivos=$(find "$directorio_origen" -type f -name "*.sh")

# Iterar sobre cada archivo encontrado
for archivo in $archivos; do
    # Extraer la fecha de creación en formato YY.mm.dd
    fecha_creacion=$(date -r "$archivo" +%y.%m.%d)

    # Nombre del archivo zip
    nombre_zip="${archivo%.*}.zip"

    # Comprobar si el archivo zip ya existe
    if [ -f "$nombre_zip" ]; then
        echo "El archivo zip '$nombre_zip' ya existe. Saltando..."
    fi

    # Comprimir el archivo .log en un archivo zip con 7zip
    echo "Comprimiendo '$archivo' en '$nombre_zip' con 7zip..."
    7z a -m0=lzma2 -mx=9 -mmt=on "$nombre_zip" "$archivo"

    # Eliminar el archivo original .log
    echo "Eliminando '$archivo'..."
    rm "$archivo"

    echo "Proceso completado para '$archivo'."
done

echo "Proceso terminado."
