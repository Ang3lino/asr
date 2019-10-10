#!/bin/sh

# Crea un grupo, de nombre p1. Incluye a los usuarios user2 y user3 en dicho grupo.
if [ $(id -u) -ne 0 ]; then
    echo 'please run as sudo'
    exit 1
fi

useradd user2
useradd user3

groupadd p1

useradd user1 p1
useradd user2 p1

