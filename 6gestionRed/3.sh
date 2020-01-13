#!/bin/sh

# Examina la configuración de red listando la información sobre interfaces, tabla de encaminamiento y puertos abierto.

ifconfig -a
route
netstat -tulpn | grep LISTEN

