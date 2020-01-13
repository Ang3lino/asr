#!/bin/sh

# Programa un script que haga una copia de seguridad de todos los usuarios del sistema (utilizando el script del punto anterior).

if [ $(id -u) -ne 0 ]; then
    echo 'please run as sudo'
    exit 1
fi

cat /etc/passwd | cut -d ':' -f3 | while read uid; do
    sh ./3.sh $uid
done

# cat /etc/passwd | cut -d ':' -f1 | while read usr; do
#     find / -user $usr -exec tar -rzvf $usr$(date -I).tgz {} \;
# done

exit 0
