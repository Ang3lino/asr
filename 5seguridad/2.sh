#!/bin/sh

# Modifica el script anterior para no incluya en la los archivos con extensión mp3 y avi

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
sudo find / -uid $uid ! -name '*.mp3' -name '*.avi' -print0 | tar -czvf ${today}${usrname}.tar.gz --null -T -


