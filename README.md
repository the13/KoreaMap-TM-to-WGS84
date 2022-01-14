TMtoWGS84
=========

통계원의 지도 shp을 위경도(WGS84)로 변환

# Prerequisite
install ogr2ogr & iconv command line tool &
```
brew install gdal libiconv
```



# Steps

1. shp파일 다운로드 http://data.nsdi.go.kr/dataset/15145
2. unzip하면 네가지 파일이 생성
   * dbf: 지도객체의 properties
   * prj: 프로젝션 정보
   * shp: 지도객체데이터
   * shx: ?

3. Encoding 처리

	국가자료라서그런지 EUC-KR
	입력한 input.dbf파일을 UTF-8로 변경한다.
	```
	./convert_encoding.sh input.dbf
	```

4. projection

	projection paramete는 다음을 참고 [google groups](https://groups.google.com/forum/#!msg/osgeo-kr/iB8N0WlsAJM/NmqQoFld7U0J)

	input.shp 같은이름의 dbf파일(input.dbf)등을 참조하여 <out.json> geojson으로 변경

	```
	./transform.sh input.shp projected
	```

5. build geoJSON
	```
	ogr2ogr -f "GeoJSON" -skipfailures out.json projected/input.shp
	```

# test
메모리를 많이먹을위험이있지만.

```
./test.sh out.json
```


# References
 * https://groups.google.com/forum/#!msg/osgeo-kr/iB8N0WlsAJM/NmqQoFld7U0J

