#!/bin/bash
cd /loghist/FF8
find Alert* \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -exec comprimefile.sh {} \;
find BPTW* \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -exec comprimefile.sh {} \;
#find wasA_Logs \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -exec comprimefile.sh {} \;
#find wasB_Logs \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -exec comprimefile.sh {} \;
#find wasD_Logs \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -exec comprimefile.sh {} \;
find WasBM* \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -exec comprimefile.sh {} \;
find bc* \( -name 'SystemErr_*.log' -o -name 'SystemOut_*.log' \) -exec comprimefile.sh {} \;
find wasCorp* \( -name 'SystemErr_23*.log' -o -name 'SystemOut_23*.log' \) -exec comprimefile.sh {} \;
#find wasCorp* \( -name 'SystemErr_*.log' \) -exec comprimefile.sh {} \;

#logs de API
#find wasWS* \( -name 'SystemOut_22*.log' -o -name 'SystemErr_22*.log' \) -exec comprimefile.sh {} \;
#find wasWS* \( -name 'SystemOut_23.0*.log' -o -name 'SystemErr_23.0*.log' \) -exec comprimefile.sh {} \;
