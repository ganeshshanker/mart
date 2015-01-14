var map;
var markers = [];
var infoWindow;

function loadMap(id,lat,lng,marders) {
	map = new google.maps.Map(document.getElementById(id), {
		center: new google.maps.LatLng(lat, lng),
		zoom: 8,
		mapTypeId: 'roadmap',
		mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU}
	});
	infoWindow = new google.maps.InfoWindow();
	setLocations(marders);
}

function clearLocations() {
	infoWindow.close();
	for (var i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
	}
	markers.length = 0;
}

function setLocations(markerNodes) {
	clearLocations();
    var bounds = new google.maps.LatLngBounds();
    for (var i = 0; i < markerNodes.length; i++) {
		var name = markerNodes[i][2];
		var address = markerNodes[i][3];
		var latlng = new google.maps.LatLng(
		parseFloat(markerNodes[i][0]),
		parseFloat(markerNodes[i][1]));
		createMarker(latlng, name, address);
		bounds.extend(latlng);
    }
    map.fitBounds(bounds);
}

function createMarker(latlng, name, address) {
  var html = "<b>" + name + "</b> <br/>" + address;
  var marker = new google.maps.Marker({
	map: map,
	position: latlng
  });
  google.maps.event.addListener(marker, 'click', function() {
	infoWindow.setContent(html);
	infoWindow.open(map, marker);
  });
  markers.push(marker);
}