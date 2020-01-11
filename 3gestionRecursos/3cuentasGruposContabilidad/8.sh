#!/bin/sh

# Crea una carpeta p1 en el directorio /home/proyectos. Asigna (a la carpeta p1)
# permiso de lectura y escritura para el grupo (p1) creado en el punto anterior.
# Los usuarios que no estén en dicho grupo no pueden leer ni escribir en el contenido de dicho directorio.

if [ $(id - u) -ne 0 ]; then
    echo 'Por favor ejecute como administrador'
    exit 1
fi

mkdir /home/proyectos /home/proyectos/p1
cd /home/proyectos/p1
chgrp p1 p1 -R
chmod g+rw p1 -R
chmod o-rw p1 -R

exit 0
