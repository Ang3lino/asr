#!/bin/bash

ACC=0
for I in "$@" ; do
    ACC=$(($I + $ACC))
done

echo $ACC

