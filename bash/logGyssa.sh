#!/bin/bash
#script realizado por Bayron Cua
#fecha 02/02/2024
#Elimina logs antiguos del filesystem logGyssa

#Declaración de Variables
#Directorio
origen=/logGyssa
#log
logrmgyssa="/tmp/logrmgyssa.log"

echo "Borrado del día $(date)" >$logrmgyssa
#Busca archivos
find $origen -type d -mtime +15 | while read file; do
	#Eliminar elarchivo
	sudo rm -rf "$file"

	# Registrar laeliminación en el log
	echo "Archivo elminado: $file" >>$logrmgyssa
done
