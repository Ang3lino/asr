#!/bin/sh

# Consultando el apartado de scripting, programa un script que liste los ficheros grandes por debajo de un directorio pasado como parámetro. No se debe utilizar el comando find. Se considera fichero grande el que ocupe mas Ks que las especificadas en el segundo parámetro. Si no existe un segundo parámetro, se tomará el valor de 1MB.

# name, size in bytes
# S sort by file size, largest first
# R list subdirectories recursively
# ls -lSR

walk_dir () {
    CURR_DIR=$1

    for pathname in "$CURR_DIR"/*; do
        if [ -d "$pathname"  ]; then
            walk_dir "$pathname"
        else
            printf '%s\n' "$pathname"
        fi
    done

}

read -p 'Enter absolute path: ' PATH_GIVEN


walk_dir $PATH_GIVEN

