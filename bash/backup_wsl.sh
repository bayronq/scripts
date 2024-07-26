#!/bin/bash
# This script makes a backup of Ubuntu WSL stuff every day
cd /root
nombre=$(hostname)
fecha=$(date '+%Y-%m-%d-%H-%M-%S')

dpkg --get-selections | grep -v deinstall >>/home/bayronq/packages.txt
tar -czvf "/mnt/d/OneDrive - Banco de Desarrollo Rural, S.A/Backups/wsl/fedora_office/${nombre}_${fecha}.tar.gz" /home/bayronq/*
echo "backup success ${fecha}"
