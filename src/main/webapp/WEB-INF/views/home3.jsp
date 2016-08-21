<%@ page session="false"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=adSBC64azkbF16aLoZgO"></script>
</head>
<body>
   <input id="illegalParking" type="checkbox" onclick="showParkLoc()">불법주정차
   다발구역
   <br>
   <input id="concentRegion" type="checkbox" onclick="showConcentReg()">집중단속구역(어린이)

   <div id="map" style="width: 100%; height: 400px;"></div>

   <script>
      //variable for storing read data
      var roadAdd = new Array();
      var parkLat = new Array();
      var parkLng = new Array();
      var caughtType = new Array();
      var numOfCaught = new Array();
      var groupId = new Array();
      var numOfMem = new Array();

      var regLat = new Array();
      var regLng = new Array();

      //markers array
      var parkMarker = new Array();
      var regMarker = new Array();
      var polygon = new Array();
      var circle = new Array();
      var markers = [],infoWindows = [];

      //rows of data for empty arrays
      var numOfLoc = 0;
      var numOfReg = 0;
      //initialize map
      map = new naver.maps.Map('map', {
         center : new naver.maps.LatLng(37.3674001, 127.1181196),
         zoom : 7
      });

      //read and make a mark
      function showParkLoc() {
         /* var fileName ="C:/Users/sw/Desktop/bundang_result2.txt";// "C:/Users/jayki/Desktop/bundangData.txt"; //
         var fileObject = new ActiveXObject("Scripting.FileSystemObject");
         var line;
         var lineSplit;
         

        
          var fOpen = fileObject.OpenTextFile(fileName, 1);
          var colName = fOpen.Readline();
          while (!fOpen.AtEndOfStream) {
             line = fOpen.Readline();
             lineSplit = line.split('\t');
             roadAdd.push(lineSplit[0]);
             parkLat.push(lineSplit[1]);
             parkLng.push(lineSplit[2]);
             caughtType.push(lineSplit[3]);
             numOfCaught.push(lineSplit[4]);
             groupId.push(lineSplit[5]);
             numOfMem.push(lineSplit[6]);

             numOfLoc++;
          }
          fOpen.close();
          */
          /* 37.3519807	127.1232509
          37.3646992	127.1073504
 			*/
 numOfLoc=2;
 			parkLat.push(37.3519807);
 			parkLng.push(127.1232509);
 			parkLat.push(37.3646992);
 			parkLng.push(127.1073504);
 			
          
          
          for (var i=0;i<numOfLoc;i++) {
        	  var position = new naver.maps.LatLng(
        			  parkLat[i],parkLng[i]);
        	  var marker = new naver.maps.Marker({
        	        map: map,
        	        position: position
        	        
        	    });
        	  var infoWindow = new naver.maps.InfoWindow({
        	        content: '<div>The</div>'
        	    });

        	    markers.push(marker);
        	    infoWindows.push(infoWindow);
          }
          
      }
      naver.maps.Event.addListener(map, 'idle', function() {
    	    updateMarkers(map, markers);
    	});

    	function updateMarkers(map, markers) {

    	    var mapBounds = map.getBounds();
    	    var marker, position;

    	    for (var i = 0; i < markers.length; i++) {

    	        marker = markers[i]
    	        position = marker.getPosition();

    	        if (mapBounds.hasLatLng(position)) {
    	            showMarker(map, marker);
    	        } else {
    	            hideMarker(map, marker);
    	        }
    	    }
    	}

    	function showMarker(map, marker) {

    	    if (marker.setMap()) return;
    	    marker.setMap(map);
    	}

    	function hideMarker(map, marker) {

    	    if (!marker.setMap()) return;
    	    marker.setMap(null);
    	}

    	// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
    	function getClickHandler(seq) {
    	    return function(e) {
    	        var marker = markers[seq],
    	            infoWindow = infoWindows[seq];

    	        if (infoWindow.getMap()) {
    	            infoWindow.close();
    	        } else {
    	            infoWindow.open(map, marker);
    	        }
    	    }
    	}

    	for (var i=0, ii=markers.length; i<ii; i++) {
    	    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
    	}
      
      
          

         
   </script>
</body>
</html>