#!/bin/bash
export  values="10.161.206.27:9058 10.161.206.27:9059 10.161.206.20:9060 10.161.206.20:9061 10.161.206.24:9062 10.161.206.24:9063 10.161.206.37:9064 10.161.206.37:9065"
export ser=$1
export ws=$2
export level=$3
for value in ${values};
do
    echo 'http://'$value'/wsjava/'$ser'/configure/?path='$ws'&level='$level
    curl -X GET 'http://'$value'/wsjava/'$ser'/configure/?path='$ws'&level='$level
done
