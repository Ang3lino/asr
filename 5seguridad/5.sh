#!/bin/sh

# Programa la ejecución del script anterior para que se ejecute a diario.

crontab -e
# Agrega la siguiente linea en el fichero crontab
# 0 0 * * * /rutadelscript/4.sh

