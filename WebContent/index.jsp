<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=${applicationScope['API_KEY']}&callback=initMap&libraries=&v=weekly" defer></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
    <script>
      let map, infoWindow;

      function initMap() {
    	const mapOptions = {
           center: { lat: 1.3440852, lng: 103.7839583 },
           zoom: 11,
           mapTypeId: google.maps.MapTypeId.HYBRID
        }
        map = new google.maps.Map(document.getElementById("map"), mapOptions);
        infoWindow = new google.maps.InfoWindow();
        const locationButton = document.createElement("button");
        locationButton.textContent = "Pan to Current Location";
        locationButton.classList.add("custom-map-control-button");
        /*map.controls[google.maps.ControlPosition.TOP_CENTER].push(
          locationButton
        );*/
        locationButton.addEventListener("click", () => {
          // Try HTML5 geolocation.
          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
              (position) => {
                const pos = {
                  lat: position.coords.latitude,
                  lng: position.coords.longitude,
                };
                infoWindow.setPosition(pos);
                infoWindow.setContent("Location found.");
                infoWindow.open(map);
                map.setCenter(pos);
                new google.maps.Marker({
                    position: pos,
                    map,
                    title: "Hello World!",
                  });
              },
              () => {
                handleLocationError(true, infoWindow, map.getCenter());
              }
            );
          } else {
            // Browser doesn't support Geolocation
            handleLocationError(false, infoWindow, map.getCenter());
          }
        });
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(
          browserHasGeolocation
            ? "Error: The Geolocation service failed."
            : "Error: Your browser doesn't support geolocation."
        );
        infoWindow.open(map);
      }
    </script>
  </head>
  <body>
    <div id="map"></div>
  </body>
</html>