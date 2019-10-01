#!/bin/bash

echo "$0 [DIR]"
echo

if [[ $# -ne 1 ]] ; then
    exit 1
fi

DIR=$1

# ls -d ./folder1/*/

if [ -d $1 ] ; then
    FILES_COUNT=$(ls -f $DIR/*\.txt | wc | awk '{print $1}')

    echo "Numero de archivos: $FILES_COUNT"
fi



