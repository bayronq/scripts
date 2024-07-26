#!/bin/bash
#tar -czvf $1.tar.gz $1
#rm $1
#comando comprime en 7z
7z a -t7z -m0=lzma2 -mx7 -mfb=64 -md=32m -ms=off -mmt=on $1.7z $1 -sdel

#comando comprime en zip
#7z a -mx=9 -mfb=64 -mmt=on "$destino/$file_name.zip" "$file_path" -sdel
