#!/bin/sh

# Haz un script que compruebe cada hora la conectividad con los siguientes nodos:

# El propio sistema local (localhost)
# La red local
# Algún nodo próximo: ej. http://www.ehu.es
# Algún servidor fiable: ej. http://www.google.com y http://www.gnu.org

check() {
    domain=$1
    echo "Testiing $domain"
    ping -c1 $domain > /dev/null
    if [ $? -eq 0 ]; then
        echo 'OK'
    else
        echo 'DOWN'
    fi
}

check localhost
check ehu.es
check google.com
check gnu.org
check lol.lol.lol
