#!/bin/sh

DIR='.'
for usr in "$DIR"/*; do
    #echo $(echo $usr | sed 's/\ /\\/g')
    if [ -d "$usr" ]; then
        N_FILES=$(find "$usr" -type f | wc -l)
        NAME=$(basename "$usr")
        BSIZE=$(stat -c "%b" "$usr")
        printf "$NAME\t$BSIZE\t$N_FILES\n"
    fi
done

