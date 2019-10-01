#!/bin/bash


function user() {
    echo $(who)
    echo "$0 [USER]"
    if [ $# -ne 1 ] ; then
        exit 1
    fi

    who | while read USER RESTO ; do
        if [ $USER = $1 ] ; then
            echo "El usuario $1 esta conectado"
            exit 0
        fi
    done

    echo "$1 no esta conectado"
    exit 1
}

for i in * ; do
    echo $i
done

exit 0
