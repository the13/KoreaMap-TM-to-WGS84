TMtoWGS84
=========

통계원의 지도 shp을 위경도(WGS84)로 변환

#Steps

1. download from data source
   * 2012_1_0.zip (state)
   * 2012_2_0.zip (city)
   * 2012_3_0.zip (dong) 
   
1. unzip them into ./original_shp/

1. (convert encoding EUC_KR into UTF8 [see](https://github.com/station3/korea-maps#encoding-conversion-from-the-shapefiles-attributesdbf)) 

1. transform projection

    the source projection is referenced by [google groups](https://groups.google.com/forum/#!msg/osgeo-kr/iB8N0WlsAJM/NmqQoFld7U0J)
    
	```bash
$ ./transform.sh
	```
	
# test

1. build geoJSON
1. drawing on google map

 	.. it takes a lot of memory. be careful


	```bash
$ ./test
	```

   


# Data Source
 * http://sgis.kostat.go.kr/statbd/statbd_03.vw#


# References
 * https://groups.google.com/forum/#!msg/osgeo-kr/iB8N0WlsAJM/NmqQoFld7U0J
 * https://github.com/station3/korea-maps
 * https://developers.skplanetx.com/apidoc/kor/t-map

