#!/bin/sh

# Crea un script que monitorize el rango de puertos de 20 a 25 de todas las máquinas en la red 127.0.0.x.

if [ $(id -u) -ne 0 ]; then
    echo 'sudo required'
    exit 1
fi

nmap 127.0.0.1 -p 20-25

