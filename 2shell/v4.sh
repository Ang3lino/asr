#!/bin/bash

function test() {
    DIR=$(pwd)
    echo $DIR

    basename $DIR

    echo ${DIR#/*/}
    echo ${DIR##/*/}
    echo ${DIR##*.}

    #echo basename $DIR | echo ${DIR%.*}
}

function name() {
    DIR=${DIR##/*/}
    DIR=${DIR%.*}

    echo $DIR
}

for DIR in $(ls) ; do
    DIR=${DIR##/*/}
    DIR=${DIR%.*}

    echo $DIR
done
