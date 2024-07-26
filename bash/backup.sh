#!/bin/bash

<<readme

Este es un script para backup con 5 días de rotación

Uso:
./basckup.sh <directorio origen> <directorio destino>
readme

function display_usage {
  echo "Uso: ./backup.sh <directorio origen> <directorio destino>"
}

if [ $# -eq 0 ]; then
  display_usage
fi

timestamp=$(date '+%Y-%m-%d-%H-%M-%S')
file_path=$1
original_dir=$(dirname "$file_path")
file_name=$(basename "$file_path" .log)
backup_dir=$2

function create_backup {
  cd $original_dir
  7z a -mx=9 -mfb=64 -mmt=on "$backup_dir/${file_name}_${timestamp}.zip" "${file_name}" >/dev/null
  #zip -r "$nombre_${timestamp}.zip" "${source}" >/dev/null
  if [ $? -eq 0 ]; then
    echo "backup generated successfuly for ${timestamp}"
  fi
}

function perform_rotation {
  backups=($(ls -t "${backup_dir}/${file_name}_"*.zip 2>/dev/null))

  if [ "${#backups[@]}" -gt 5 ]; then
    echo "Performing rotation for 5 days"

    backups_to_remove=("${backups[@]:5}")
    echo "${backups_to_remove[@]}"

    for backup in "${backups_to_remove[@]}"; do
      rm -rf ${backup}
    done
  fi
}

create_backup
perform_rotation
