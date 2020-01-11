#!/bin/sh

# Por cada ususuario que tenga al menos un proceso en ejecución, indica cuántos procesos en ejecución tiene en total.

ps hax -o user | sort | uniq -c


