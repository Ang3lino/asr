#!/bin/bash

ACC=0

#read CURR
#while [[ $? == 0 ]] ; do
#    read CURR
#    ACC=$(($ACC + $CURR))
#done

while read CURR ; do
    ACC=$(($ACC + $CURR))

    echo $ACC
    echo
done


# [] test []...

echo $ACC
