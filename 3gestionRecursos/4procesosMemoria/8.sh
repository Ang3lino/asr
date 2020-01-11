#!/bin/sh

./7.sh | while read line; do
    pid=$(echo $line | cut -d ' ' -f1)
    kill -16 $pid
    echo "Se ha detenido el proceso con pid: $pid"
done
