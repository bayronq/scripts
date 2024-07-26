#!/bin/bash

# VARIABLES
fecha=$(date +'%Y%m%d')
ayer=$(date -d "yesterday" "+%Y-%m-%d")

echo "iniciando compresión de logs"
cd /opt/tomcat/logs
tar -czvf /work/logs/tomcat/catalina-$fecha.tar.gz catalina.out catalina.20*.log host-manager.20*.log localhost.20*.log manager.20*.log localhost_access_log.20*.txt 
sleep 30
echo "----------------------------------------------------------------------------------------------------------"
echo "iniciando borrado de logs"
rm -rf catalina.20*.log host-manager.20*.log localhost.20*.log manager.20*.log localhost_access_log.20*.txt 
cat /dev/null > catalina.out

echo "----------------------------------------------------------------------------------------------------------"
echo "iniciando reinicio "
systemctl restart tomcat9
echo "fin de backup $ayer"


