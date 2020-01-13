#!/bin/sh

# Modifica el script anterior para que lea las extensiones de los archivos de los que no debe hacer copia del fichero blacklist.conf, que tiene el siguiente formato

# mp3
# avi
# mp4

# verifique los argumentos
if [ $(id -u) -ne 0 ]; then
    echo 'please run as sudo'
    exit 1
fi

srclist='./blacklist.conf'

if [ $# -ne 1 ]; then
    echo "$0 [uid]"
    exit 1
fi

if [ ! -f  $srclist ]; then
    echo "No existe el archivo $srclist"
    exit 1
fi

uid=$1
usrname=$(grep $uid /etc/passwd | cut -d ':' -f1)
today=$(date -I)

regex=$(sed ':a;N;$!ba;s/\n/|/g' $srclist)
echo $regex
result=$(find ./test -type f | grep -vE "$regex")
tar -czvf ${today}${usrname}.tar.gz $result

exit 0
