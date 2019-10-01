#!/bin/sh

used='loooool%'
used=$(echo $used | sed 's/%//')

echo $used
