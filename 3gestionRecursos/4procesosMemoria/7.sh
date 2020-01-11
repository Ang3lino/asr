#!/bin/sh

# A partir del resultado previo queremos filtrar aquellos procesos cuyo porcentaje de uso de CPU sea superior al 20%.

cat listaProcesosExcesoCpu.txt | while read line; do
    cpu=$(echo $line | cut -d ' ' -f3)
    cpu=$(echo $cpu | cut -d '.' -f1)
    if [ $cpu -gt 20 ]; then
        echo $line
    fi
done

