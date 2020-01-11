#!/bin/sh

# Crea un script que, recibiendo como parámetros el nombre del grupo y sus miembros, realice todos los pasos anteriores. El script deberá controlar su salida estándar y errores, junto con el código de finalización (éxito o error).

if [ $# -lt 2 ]; then
    echo 'Instrucciones del script'
    echo "$0 [GROUPNAME] [USERNAMES...]"
    exit 1
fi

if [ $(id - u) -ne 0 ]; then
    echo 'Permisos de administrador requeridos'
    exit 1
fi

grpname=$1
addgroup $grpname
for name in $*; do
    useradd $name $grpname
done

exit 0
