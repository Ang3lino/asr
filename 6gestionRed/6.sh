#!/bin/sh

# Programa un script que proporcione la lista de direcciones IP activas en su red local, entendiendo por máquinas activas aquellas que responden al comando ping y por red local el conjunto de direcciones IP que se obtiene al aplicar la máscara 255.255.255.0 a la propia dirección IP.

if [ $# -ne 1 ]; then
    echo "$0 [ipaddr]"
    exit 1
fi

ip=$1

a=$(echo $ip | cut -d '.' -f1)
b=$(echo $ip | cut -d '.' -f2)
c=$(echo $ip | cut -d '.' -f3)

for i in $(seq 1 255); do
    ipi="${a}.${b}.${c}.${i}"
    ping -c1 $ipi > /dev/null
    if [ $? -eq 0 ]; then
        echo "${ipi} [OK]"
    fi
done

exit 0
