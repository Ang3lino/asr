#!/bin/sh

printf "Programa un script que examine las unidades montadas y muestre un listado con las unidades que tengan libre menos de un 15% del espacio total.  \n\n"


df -h | tail -n +2 |  # begin from the second line
while read filesystem size used avail use mounted_on
do
    used=$(echo $use | sed 's/%//')  # remove percentage symbol
    if [ $used -lt 15 ]
    then
        echo "$filesystem $size $used $avail $use $mounted_on"
    fi
done
