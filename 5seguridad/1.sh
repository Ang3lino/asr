#!/bin/sh

# Programa un script que, recibiendo como parámetro un identificador de usuario, genera un archivo comprimido, de nombre /backup/2011-10-01-nombreusuario.tar.gz con el contenido del directorio principal de ese usuario. Notas:
#
# No se puede presuponer que el directorio principal del usuario estará en /home/nombre-usuario.
# nombreusuario varía en función del parámetro recibido.
# 2011-10-01 indica el día de la copia

# verifique los argumentos
if [ $(id -u) -ne 0 ]; then
    echo 'please run as sudo'
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "$0 [UID]"
    exit 1
fi

uid=$1
usrname=$(grep $uid /etc/passwd | cut -d ':' -f1)
today=$(date -I)

# tar
# c: create. To extract, replace c by x
# z: zip, compress
# v: verbose, not required actually
# f: filename
sudo find / -uid $uid -print0 | tar -czvf ${today}${usrname}.tar.gz --null -T -


