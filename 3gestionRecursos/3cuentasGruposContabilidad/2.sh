#!/bin/sh

# Crea un script que dado un nombre de usuario como argumento, escriba en la
# salida estándar el código de usuario (UID) que le corresponde.

if [ $# -ne 1 ]; then
    echo 'Se debe de proveer el nombre de usuario.'
    exit 1
fi

usrname=$1
gid=$(grep $usrname /etc/passwd | cut -d ':' -f4)
echo $gid

exit 0

