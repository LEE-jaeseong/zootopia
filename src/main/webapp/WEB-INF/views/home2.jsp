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
      var testInfoWindows=new Array();

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
         var fileName ="C:/Users/sw/Desktop/bundang_result2.txt";
         // "C:/Users/jayki/Desktop/bundangData.txt"; //
         var fileObject = new ActiveXObject("Scripting.FileSystemObject");
         var line;
         var lineSplit;

          var infowindow = new naver.maps.InfoWindow({
            content : "infowindow",
            maxWidth : 140,
            backgroundColor : "#eee",
            borderColor : "#2db400",
            borderWidth : 5,
            anchorSize : new naver.maps.Size(30, 30),
            anchorSkew : true,
            anchorColor : "#eee",
            pixelOffset : new naver.maps.Point(20, -20)
         });

         if (document.getElementById("illegalParking").checked == true) {
            if (!fileObject.FileExists(fileName)) {
               alert("no file");
            } else {
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
            }
           

            for (var i = 0; i < numOfLoc; i++) {
               var marker = new naver.maps.Marker(
                     {
                        position : new naver.maps.LatLng(parkLat[i],
                              parkLng[i]),
                        map : map,
                        clickable : true

                     });
               var pointMarker = marker.getPosition();
               
               var testInfoWindow = new naver.maps.InfoWindow({
                   content: 'test...'
               });
               
               parkMarker.push(pointMarker);
               testInfoWindows.push(testInfoWindow);
              
 
            }
//            for(var i=0;i<100;i++){
               makePolygon(1);
   //         }

         } else {
            for (var i = 0; i < numOfLoc; i++) {
               parkMarker[i].setVisible(false);
               //   polygon.setVisible(false);
            }
            for (var i = 0; i < numOfLoc; i++) {
               roadAdd.pop();
               parkLat.pop();
               parkLng.pop();
               caughtType.pop();
               numOfCaught.pop();
               groupId.pop();
               numOfMem.pop();
               parkMarker.pop();
               polygon.pop();

            }
            numOfLoc = 0;
         }
      }

      function makePolygon(ID) { //groupid의 갯수도 받아주면 좋다.
         var group = new Array();
         if(parkLat.length>2){
            for (var i = 0; i < parkLat.length; i++) {
            //for (var j = 0; j < parkLat.length; j++) {
               if (groupId[i] == ID) {
                  path = new naver.maps.LatLng(parkLat[i], parkLng[i]);
                  group.push(path);
               }
            }
         }
         polygon[i] = new naver.maps.Polygon({
            map : map,
            paths : group,
            fillColor : '#ff0000',
            fillOpacity : 0.3,
            strokeColor : '#ff0000',
            strokeOpacity : 0.6,
            strokeWeight : 3,
         });
         /* for (var k; k < polygon.length; k++) {
            naver.maps.Event.addListener(polygon[k], "mouseover", function(e) {
               map.setCursor("pointer");
               polygon.setOptions({
                  fillOpacity : 0.8
               });
            });
            naver.maps.Event.addListener(polygon[k], "mouseout",
                  function(e) {
                     map.setCursor("auto");

                     polygon.setOptions({
                        fillOpacity : 0.3
                     });
                  });
         } */

      }
         ///
    /* naver.maps.Event.addListener(map, 'idle', function() {
    	updateMarkers(map, parkMarker);
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
    	} */

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
    	        var marker = parkMarker[seq],
    	            infoWindow = testInfoWindows[seq];

    	        if (infoWindow.getMap()) {
    	            infoWindow.close();
    	        } else {
    	            infoWindow.open(map, marker);
    	        }
    	    }
    	}

    	for (var i=0, ii=parkMarker.length; i<ii; i++) {
    	    naver.maps.Event.addListener(parkMarker[i], 'click', getClickHandler(i));
    	}
    	////

      function showConcentReg() {
         var fileName = "C:/Users/jayki/workspace/new_dataroad/children.txt";
         var fileObject = new ActiveXObject("Scripting.FileSystemObject");
         var line;
         var lineSplit;

         if (document.getElementById("concentRegion").checked == true) {
            if (!fileObject.FileExists(fileName)) {
               alert("no file");
            } else {
               var fOpen = fileObject.OpenTextFile(fileName, 1);
               var colName = fOpen.Readline();
               while (!fOpen.AtEndOfStream) {
                  line = fOpen.Readline();
                  lineSplit = line.split('\t');
                  regLat.push(lineSplit[0]);
                  regLng.push(lineSplit[1]);
                  numOfReg++;
               }
               fOpen.close();
            }

            for (var i = 0; i < regLat.length; i++) {
               regMarker[i] = new naver.maps.Marker(
                     {
                        position : new naver.maps.LatLng(regLat[i],
                              regLng[i]),
                        map : map,
                        icon : {
                           url : 'https://upload.wikimedia.org/wikipedia/commons/e/e1/Map_marker_icon_%E2%80%93_Nicolas_Mollet_%E2%80%93_CCTV_%E2%80%93_Transportation_%E2%80%93_Light.png',
                           size : new naver.maps.Size(38, 58),
                           anchor : new naver.maps.Point(19, 58),

                        }
                     });
               circle[i] = new naver.maps.Circle({
                  map : map,
                  center : new naver.maps.LatLng(regLat[i], regLng[i]),
                  radius : 1000,
                  fillColor : 'crimson',
                  fillOpacity : 0.8
               });

            }

         } else {
            for (var i = 0; i < numOfReg; i++) {
               regMarker[i].setVisible(false);
               circle[i].setVisible(false);
            }
            for (var i = 0; i < numOfReg; i++) {
               regMarker.pop();
               regLat.pop();
               regLng.pop();
               circle.pop();
            }
            numOfReg = 0;

         }
      }
   </script>
</body>
</html>