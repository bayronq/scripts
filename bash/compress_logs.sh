#!/bin/bash

# Directorio de búsqueda
SEARCH_DIR="/loghist/FF8/ihs02" # Reemplaza con la ruta al directorio donde deseas buscar

# Función para comprimir archivos
compress_log_file() {
    local file_path=$1
    local original_dir=$(dirname "$file_path")
    local file_name=$(basename "$file_path" .log)

    # Obtiene fecha de modificación del archivo
    local mod_year=$(date -r "$file_path" +"%Y")
    local mod_month=$(date -r "$file_path" +"%m")
    local mod_day=$(date -r "$file_path" +"%d")

    # Crear estructura de directorios Año/Mes/Día
    local target_dir="$SEARCH_DIR/$mod_year/$mod_month/$mod_day"
    mkdir -p "$target_dir"

    # Comprime el archivo con máxima compresión y lo guarda en la estructura de directorios
    7z a -mx=9 "$target_dir/$file_name.zip" "$file_path" -sdel
}

export -f compress_log_file
export SEARCH_DIR

# Buscar archivos .log y aplicar la función de compresión a cada uno
find "$SEARCH_DIR" -name '*.log' -exec bash -c 'compress_log_file "$0"' {} \;

echo "Compresión de archivos .log finalizada."
