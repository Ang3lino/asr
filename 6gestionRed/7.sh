#!/bin/sh

# Comprueba la velocidad y por qué nodos atraviesa la comunicación con la dirección http://www.elhuyar.com. Haz lo mismo para la dirección http://www.ehu.es

traceroute elhuyar.com
echo
traceroute ehu.es
