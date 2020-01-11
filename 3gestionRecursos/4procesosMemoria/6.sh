#!/bin/sh

# Queremos obtener la lista de los procesos (PIDs) de usuario que tienen un tiempo de CPU superior a 120 segundos (00:02:00). Por cada proceso detectado, debemos añadir su PID UID PCPU TCPU y CMD en el fichero /var/log/Lista-procesos-ExcesoCPU.txt.

if [ $(id -u) -ne 0 ]; then
    echo 'Ejecute como superusuario'  # requerido pues se intenta escribir en /var/log/
    exit 1
fi

ps -eo pid,uid,pcpu,cmd,time | while read line; do
    time=$(echo $line | rev | cut -d ' ' -f1 | rev)
    hh=$(echo $time | cut -d ':' -f1)
    mm=$(echo $time | cut -d ':' -f2)
    ss=$(echo $time | cut -d ':' -f3)
    count=$((3600*$hh + 60*$mm + $ss))
    echo $hh $mm $ss
    echo $count
    if [ $count -ge 120 ]; then
        echo $line
        echo $line > /var/log/listaProcesosExcesoCpu.txt
    fi
    echo ""
done

# ESTO ES ORO, asi se separa una cadena en donde no se saben cuantos campos
# sentence='12:32:48'
# IFS=':'
# for x in $sentence; do
#     echo $x
# done

