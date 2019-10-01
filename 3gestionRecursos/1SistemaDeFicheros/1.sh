#!/bin/sh

# y
# if ! [ $(id -u) = 0 ] ; then

# n
# if [ $UID -ne 0 ] ; then

if [ "$UID" != "0" ] ; then
    echo 'Please run as sudo'
    exit 1
fi

PERMISSION='755'
RANDOM_FILE='file.txt'

touch $RANDOM_FILE
chmod $PERMISSION $RANDOM_FILE
