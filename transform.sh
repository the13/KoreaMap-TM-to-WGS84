#!/bin/sh

# false north (y_0) is 500000 (err? 306)
# false east (x_0) is 200000 (err? 72.5)

SOURCE_PROJECTION="+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=199927.5 +y_0=499694 +ellps=GRS80 +units=m +no_defs"
rm -r transformed_shp > /dev/null
mkdir transformed_shp


ogr2ogr -s_srs "$SOURCE_PROJECTION" -t_srs WGS84 -f "ESRI Shapefile" -skipfailures transformed_shp/state.shp original_shp/state.shp -lco ENCODING=UTF-8
ogr2ogr -s_srs "$SOURCE_PROJECTION" -t_srs WGS84 -f "ESRI Shapefile" -skipfailures transformed_shp/city.shp original_shp/city.shp -lco ENCODING=UTF-8
ogr2ogr -s_srs "$SOURCE_PROJECTION" -t_srs WGS84 -f "ESRI Shapefile" -skipfailures transformed_shp/dong.shp original_shp/dong.shp  -lco ENCODING=UTF-8
