#!/bin/bash

#variables
origen="/loghist/FF8"

#array
diario=('AlertC01' 'AlertD02' 'BPTWA01' 'BPTWB01' 'BPTWC01' 'BPTWD01' 'bcC01' 'bcD01')
mensual=('wasWSA01' 'wasWSA02' 'wasWSB01' 'wasWSB02' 'wasWSC01' 'wasWSC02' 'wasWSD01' 'wasWSD03' 'WasBM_C01' 'WasBM_D01' 'wasCorpC_Logs' 'wasCorpD_Logs' 'wasA_Logs' 'wasB_Logs' 'wasD_Logs')

# Función para comprimir archivos
compress_log_file() {
    fecha=$(date +%D" "%T)
    local file_path=$1
    local original_dir=$(dirname "$file_path")
    local file_name=$(basename "$file_path" .log)
    log="$original_dir"/ordercompress.log
    # Obtiene fecha de modificación del archivo
    local mod_year=$(date -r "$file_path" +"%Y")
    local mod_month=$(date -r "$file_path" +"%m")
    local mod_day=$(date -r "$file_path" +"%d")

    # Crear estructura de directorios Año/Mes/Día
    local destino="$original_dir/$mod_year/$mod_month/$mod_day"
    if [ ! -d "$destino" ]; then
        mkdir -p "$destino"
    fi

    echo $fecha "Archivo Original $file_path, Ruta Respaldo: $destino/$file_name" >>$log
    # Comprime el archivo con máxima compresión y lo guarda en la estructura de directorios
    7z a -mx=9 -mfb=64 -mmt=on "$destino/$file_name.zip" "$file_path" -sdel
}

export -f compress_log_file
export origen

for i in "${diario[@]}"; do
    # Buscar archivos .log y aplicar la función de compresión a cada uno
    origen2=$origen/$i
    echo "Carptea Actual $origen2"
    find $origen2 \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -type f -mtime +10 | while read file; do
        #llama a la función para comprimir y ordenar
        compress_log_file $file
    done
done

for i in "${mensual[@]}"; do
    # Buscar archivos .log y aplicar la función de compresión a cada uno
    origen2=$origen/$i
    echo "Carptea Actual $origen2"
    find $origen2 \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -type f -mtime +31 | while read file; do
        #llama a la función para comprimir y ordenar
        compress_log_file $file
    done
done

echo "Compresión y Ordenamiento de archivos .log finalizada con éxito"
