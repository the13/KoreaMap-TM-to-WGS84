#!/bin/sh

# # https://blog.daum.net/jangbi/16474845

# SOURCE_PROJECTION="+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=199927.5 +y_0=499694 +ellps=GRS80 +units=m +no_defs"

# # https://epsg.io/5179
SOURCE_PROJECTION="+proj=tmerc +lat_0=38 +lon_0=127.5 +k=0.9996 +x_0=1000000 +y_0=2000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
# 중부원점
# SOURCE_PROJECTION="+proj=tmerc +lat_0=38 +lon_0=131 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs"

ogr2ogr -s_srs "$SOURCE_PROJECTION" -t_srs WGS84 -f "ESRI Shapefile" -skipfailures $2 $1 -lco ENCODING=UTF-8
