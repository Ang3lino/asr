#!/bin/bash


if [ -d $1 ] ; then
    FILES_COUNT=$(ls -f $HOME/*\.txt | wc | awk '{print $1}')

    echo "Numero de archivos: $FILES_COUNT"
fi

