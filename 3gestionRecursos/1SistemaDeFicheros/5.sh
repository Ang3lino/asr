#!/bin/sh
# Busca en tu cuenta los ficheros que en la parte de datos contienen la palabra ‘script’.

find . | while read filepath
do
    if ! [ -d $filepath ]
    then
        grep -q script $filepath
        if [ $? -eq 0 ]
        then
            echo $filepath
        fi
    fi
done

