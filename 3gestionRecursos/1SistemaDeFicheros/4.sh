#!/bin/sh

declare -a ARR

i=0
for FILE in dir/* ; do
    echo $FILE
    ARR[i]=$FILE
    i=$((i + 1))
done
