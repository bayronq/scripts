#!/bin/bash
export  values="10.161.206.52:9058 10.161.206.52:9059 10.161.206.53:9060 10.161.206.53:9061 10.161.206.54:9062 10.161.206.54:9063 10.161.206.55:9064 10.161.206.55:9065"
export ser=transfers
export ws=Transferencias
export level=BOTH
for value in ${values};
do
    echo 'http://'$value'/wsjava/'$ser'/configure/?path='$ws'&level='$level
    curl -X GET 'http://'$value'/wsjava/'$ser'/configure/?path='$ws'&level='$level
done
