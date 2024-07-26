#!/bin/bash

rsync -av --partial --progress ~/Repo/capamediabdr/target/capa-media.war vmcmprod01:/home/bcua
rsync -av --partial --progress ~/Repo/capamediabdr/target/capa-media.war vmcmprod02:/home/bcua
rsync -av --partial --progress ~/Repo/capamediabdr/target/capa-media.war vmcmprod03:/home/bcua
rsync -av --partial --progress ~/Repo/capamediabdr/target/capa-media.war vmcmprod04:/home/bcua
