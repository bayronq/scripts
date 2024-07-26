#!/bin/bash

fstab_mount=($(awk '/^UUI/{print $2}' /etc/fstab))
current_mount=($(grep -P '^/dev/(?!.*snap)' /proc/mounts | awk '{print $2}'))

for i in ${fstab_mount[@]}
do 
  if [[ ${current_mount[@]} != *"$i"* ]]
  then
    echo "Este punto de montaje NO SE ENCUENTRA MONTADO:"
    grep "$i" /etc/fstab | awk '{print $2}'
    out='fail'
  fi 
done

if [ -z $out ]
then
  echo "Todos los discos se encuentran montados correctamente."
fi 
