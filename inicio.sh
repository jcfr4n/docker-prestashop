#!bin/bash
clear
read -p "Prefijo de las tablas (sin _ ): " PREFIJO
echo "PREFIJO=${PREFIJO}_" >> .env
read -t 1 -p "Listos..." timeout
echo ""
NOMBRE_PROYECTO=${PWD##*/}
read -t 1 -p "Obteniendo nombre del proyecto..." timeout
echo ""
echo "NOMBRE_PROYECTO=$NOMBRE_PROYECTO" >> .env
echo "DB=${NOMBRE_PROYECTO}" >> .env
read -t 1 -p "Preparando configuración..." timeout
echo ""
rm -rf .git
mkdir data
cp .gitignore ./data
cd data
git init
cd ..
echo ""
read -t 10 -p "Iniciando..." timeout
docker-compose up --build
