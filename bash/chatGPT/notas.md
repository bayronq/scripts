Este script utiliza el comando "find" para obtener las fechas de creación de los archivos en la carpeta de origen. La opción "-type f" especifica que solo se deben buscar archivos (no directorios), y la opción "-printf" especifica el formato de salida, que en este caso es la fecha de creación en formato YYYY-MM-DD.

El resultado de "find" se ordena con "sort" y se eliminan las fechas duplicadas con "uniq". Luego, se recorre la lista de fechas encontradas con un bucle "for" y se crea una carpeta de destino para cada fecha de creación.

Para copiar los archivos de origen a la carpeta de destino correspondiente, se utiliza el comando "rsync" con las opciones "-avz". La opción "--include='/'" incluye todos los directorios, la opción "--include='.$f'" incluye solo los archivos con la fecha de creación correspondiente, y la opción "--exclude='*'" excluye todos los demás archivos. La variable "$f" se utiliza para especificar la fecha de creación en cada iteración del bucle.

Finalmente, el script imprime un mensaje de finalización.

Para ejecutar el script, guarda el archivo con extensión .sh, por ejemplo backup_loghist_fechas.sh, y ejecútalo en la terminal usando el comando "bash backup_loghist_fechas.sh". Asegúrate de que el script tenga permisos de ejecución, para ello puedes usar el comando "chmod +x backup_loghist_fechas.sh" para otorgar permisos de ejecución al archivo.





