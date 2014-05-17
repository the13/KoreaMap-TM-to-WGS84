#!/bin/sh


rm test/*.json > /dev/null

ogr2ogr -f "GeoJSON" -skipfailures test/state.json transformed_shp/state.shp
ogr2ogr -f "GeoJSON" -skipfailures test/city.json transformed_shp/city.shp
ogr2ogr -f "GeoJSON" -skipfailures test/dong.json transformed_shp/dong.shp

open http://localhost:8000/test
python -m SimpleHTTPServer 8000
