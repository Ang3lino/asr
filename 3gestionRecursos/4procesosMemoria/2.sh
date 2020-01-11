#!/bin/sh

# Crea un proceso en segundo plano (por medio de &). Pásalo a primer plano y otra vez atrás. Consigue su identificador, bájale la prioridad (renice) y finalmente hazlo terminar.

sleep 120 &
fg

bg
renice 15 $pid
kill -9 $pid
