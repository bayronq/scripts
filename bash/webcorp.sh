#!/bin/bash
#--Declaración de Variables
IHS1=10.160.202.41
IHS2=10.160.202.43
corp=/usr/IBM/HTTPServer/htdocs/corp/

cd /mnt/d/Versionamiento/Desarrollo/CBE/PreProduccion/FFusion83/CORP\ \(CB\)/27\ \(robusto\)
	scp -r web root@$IHS1:$corp
	scp -r web root@$IHS2:$corp
