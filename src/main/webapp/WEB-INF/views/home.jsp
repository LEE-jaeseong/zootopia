<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" session="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=G09DPwp6ro_zbvfwSnqs"></script>
</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>

<script>
var HOME_PATH = window.HOME_PATH || '.';
var MARKER_SPRITE_X_OFFSET = 29,
    MARKER_SPRITE_Y_OFFSET = 50,
    MARKER_SPRITE_POSITION = {
        "A0": [0, 0],
        "B0": [MARKER_SPRITE_X_OFFSET, 0],
        "C0": [MARKER_SPRITE_X_OFFSET*2, 0],
        "D0": [MARKER_SPRITE_X_OFFSET*3, 0],
        "E0": [MARKER_SPRITE_X_OFFSET*4, 0],
        "F0": [MARKER_SPRITE_X_OFFSET*5, 0],
        "G0": [MARKER_SPRITE_X_OFFSET*6, 0],
        "H0": [MARKER_SPRITE_X_OFFSET*7, 0],
        "I0": [MARKER_SPRITE_X_OFFSET*8, 0],

        "A1": [0, MARKER_SPRITE_Y_OFFSET],
        "B1": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET],
        "C1": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET],
        "D1": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET],
        "E1": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET],
        "F1": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET],
        "G1": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET],
        "H1": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET],
        "I1": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET],

        "A2": [0, MARKER_SPRITE_Y_OFFSET*2],
        "B2": [MARKER_SPRITE_X_OFFSET, MARKER_SPRITE_Y_OFFSET*2],
        "C2": [MARKER_SPRITE_X_OFFSET*2, MARKER_SPRITE_Y_OFFSET*2],
        "D2": [MARKER_SPRITE_X_OFFSET*3, MARKER_SPRITE_Y_OFFSET*2],
        "E2": [MARKER_SPRITE_X_OFFSET*4, MARKER_SPRITE_Y_OFFSET*2],
        "F2": [MARKER_SPRITE_X_OFFSET*5, MARKER_SPRITE_Y_OFFSET*2],
        "G2": [MARKER_SPRITE_X_OFFSET*6, MARKER_SPRITE_Y_OFFSET*2],
        "H2": [MARKER_SPRITE_X_OFFSET*7, MARKER_SPRITE_Y_OFFSET*2],
        "I2": [MARKER_SPRITE_X_OFFSET*8, MARKER_SPRITE_Y_OFFSET*2]
    };

var map = new naver.maps.Map('map', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
});

var bounds = map.getBounds(),
    southWest = bounds.getSW(),
    northEast = bounds.getNE(),
    lngSpan = northEast.lng() - southWest.lng(),
    latSpan = northEast.lat() - southWest.lat();

var markers = [],
    infoWindows = [];
var parkLat = new Array();
var parkLng = new Array();
var roadAdd = new Array();

	parkLat.push(37.3519807);
	parkLng.push(127.1232509);
	parkLat.push(37.3646992);
	parkLng.push(127.1073504);
	
	var fileName ="C:/Users/sw/Desktop/bundang_result2.txt";// "C:/Users/jayki/Desktop/bundangData.txt"; //
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
		

	   
	for (var key in MARKER_SPRITE_POSITION) {
	
		var position = new naver.maps.LatLng(parkLat[0],parkLng[0]);


    var marker = new naver.maps.Marker({
        map: map,
        position: position,
        title: key,
        icon: {
            url: HOME_PATH +'/img/example/sp_pins_spot_v3.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1])
        },
        zIndex: 100
    });

    var infoWindow = new naver.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ key.substr(0, 1) +'"</b>.</div>'
    });

    markers.push(marker);
    infoWindows.push(infoWindow);
};

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