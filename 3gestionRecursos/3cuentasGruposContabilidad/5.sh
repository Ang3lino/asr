#!/bin/sh
# Crea un script que enumere las cuentas de tipo superusuario.

superusers=$(grep sudo /etc/group | rev | cut -d ':' -f1 | rev)
echo $superusers | sed 's/,/\n/g' |
while read usr; do
    echo $(grep $usr /etc/passwd)
done
