#!/bin/sh

# Programa un script que, obteniendo como parámetro uno de sus interfaces de red activos, obtenga la dirección IP asociada.

if [ $# -ne 1 ]; then
    echo "$0 [iface]"
    exit 1
fi

iface=$1
ip -4 -o addr show $iface | sed 's/\s\+/\t/g' | cut -f4

# otra forma
# ifconfig $iface | sed '2q;d' | awk '{ print $2 }'

