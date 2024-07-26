#!/bin/bash
#--Declaración de Variables
IHS1=10.160.202.41
IHS2=10.160.202.43
cebs=/usr/IBM/HTTPServer/htdocs/cb/

cd /mnt/d/Versionamiento/Desarrollo/CBE/PreProduccion/FFusion83/CEBS83/Nuevo\ ambiente\ 27
	scp -r web root@$IHS1:$cebs
	scp -r web root@$IHS2:$cebs 
