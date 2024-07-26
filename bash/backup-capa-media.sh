#!/bin/bash 

ayer=$(date -d "yesterday" "+%Y-%m-%d")
cd /work/logs/capamedia/archived/
tar -czvf /work/logs/capamedia-his/capa-media-logger-$ayer.tar.gz capa-media-logger-$ayer.*.log && rm -rf capa-media-logger-$ayer.*.log

echo "fin de backup $(date)"
