#!/usr/bin/bash

cd /var
find logs \( -name '*.log' \) -exec /var/scripts/limpialogs/rmfile.sh {} \;

cd /var/adm/
cat /dev/null > user.log

