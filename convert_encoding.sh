#!/bin/bash
CSV_FILENAME_1=`echo ".work/$1" | sed s/.dbf$/.1.csv/`
CSV_FILENAME_2=`echo ".work/$1" | sed s/.dbf$/.2.csv/`

mkdir .work

echo "[+] Convert to CSV files from dbf files."
ogr2ogr -F "CSV" $CSV_FILENAME_1 $1

echo "[+] EUC-KR to UTF8."
iconv -f euc-kr -t utf8 $CSV_FILENAME_1 > $CSV_FILENAME_2

echo "[+] print first 2 lines"
head -n2 $CSV_FILENAME_2


echo "Convert back to dbf files in utf-8."
ogr2ogr -F "ESRI Shapefile" .work/$1 $CSV_FILENAME_2 -lco ENCODING=UTF-8
cp .work/$1 $1

rm -rf .work/