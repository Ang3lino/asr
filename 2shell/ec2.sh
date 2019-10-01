#!/bin/bash

if [[ $# -eq 2 ]] ; then
    echo 'ok'
else
    echo "$0 [NUMBER] [NUMBER]"
    exit 1
fi

if [[ $1 -lt $2 ]] ; then
    echo "$2 es mayor"
else
    echo "$1 es mayor"
fi

