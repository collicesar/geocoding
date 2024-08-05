#!/usr/bin/env bash

cd ../data/inegi

# echo "descargando geojson de estados"
# curl https://gaia.inegi.org.mx/wscatgeo/geo/mgee/ -o estados/estados.json

echo "descargando geojson de municipios"
for code in $(seq -f "%02g" 1 32)
do
 curl https://gaia.inegi.org.mx/wscatgeo/geo/mgee/$code -o estados/$code.json
 curl https://gaia.inegi.org.mx/wscatgeo/geo/mgem/$code -o municipios/$code.json
done