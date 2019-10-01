#!/bin/bash

function name() {
    DIR=${DIR##/*/}
    DIR=${DIR%.*}

    echo $DIR
}

for DIR in $HOME/* ; do
    DIR=${DIR##/*/}
    DIR=${DIR%.*}

    echo $DIR
    if [ -f $DIR ] ; then
        echo $DIR
    fi
done
