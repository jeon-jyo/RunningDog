<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailMap</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ovgjjriioc&submodules=geocoder"></script>
<style>
	#map {
		width: 745px;
		height: 380px;
	}
</style>
</head>
<body>
	<div class="main-map" id="map"></div>
</body>
<script type="text/javascript">

	/* map */
	let coords = ${coordsJson };
	
	var map = new naver.maps.Map('map', {
 		zoom: 16,
		center: new naver.maps.Point(coords[0].lng, coords[0].lat)
	});
	
	let trailPath = [];
	for(let i = 0; i < coords.length; i++) {
		trailPath.push(new naver.maps.LatLng(coords[i].lat, coords[i].lng));
	}
	
	var polyline = new naver.maps.Polyline({
		path: trailPath,
        strokeColor: '#fc5200',
        strokeOpacity: 0.8,
        strokeWeight: 5,
        zIndex: 2,
        clickable: true,
        map: map
    });
	
</script>
</html>