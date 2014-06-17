#!/bin/bash

# Clear files.
rm "state.csv" > /dev/null
rm "city.csv" > /dev/null
rm "dong.csv" > /dev/null

rm "state.dbf" > /dev/null
rm "city.dbf" > /dev/null
rm "dong.dbf" > /dev/null

# Convert to CSV files from dbf files.
ogr2ogr -F "CSV" state.csv state.euc_kr.dbf
ogr2ogr -F "CSV" city.csv city.euc_kr.dbf
ogr2ogr -F "CSV" dong.csv dong.euc_kr.dbf

# Replace the column names(Korean) to *_code, *_name.
sed '1 s/^.*$/state_code,state_name/g' state.csv > state2.csv
sed '1 s/^.*$/state_code,state_name,city_code,city_name/g' city.csv > city2.csv
sed '1 s/^.*$/state_code,state_name,city_code,city_name,dong_code,dong_name/g' dong.csv > dong2.csv

# EUC-KR to UTF8
iconv -f euc-kr -t utf8 state2.csv > state3.csv && rm state2.csv
iconv -f euc-kr -t utf8 city2.csv > city3.csv && rm city2.csv
iconv -f euc-kr -t utf8 dong2.csv > dong3.csv && rm dong2.csv

# Convert back to dbf files in utf-8.
ogr2ogr -F "ESRI Shapefile" state.dbf state3.csv -lco ENCODING=UTF-8
ogr2ogr -F "ESRI Shapefile" city.dbf city3.csv -lco ENCODING=UTF-8
ogr2ogr -F "ESRI Shapefile" dong.dbf dong3.csv -lco ENCODING=UTF-8

