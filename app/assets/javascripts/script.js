document.addEventListener('DOMContentLoaded', function () {
  if (document.querySelectorAll('#map').length > 0)
  {
    if (document.querySelector('html').lang)
      lang = document.querySelector('html').lang;
    else
      lang = 'en';

    var js_file = document.createElement('script');
    js_file.type = 'text/javascript';
    js_file.src = 'https://maps.googleapis.com/maps/api/js?callback=initMap&language=' + lang;
    document.getElementsByTagName('head')[0].appendChild(js_file);
  }
  });

  var map;

  function initMap() {
    fetch('/apartments.json', {
      credentials: 'include'
    })
      .then(function(response){
        console.log(response);
        return response.json();
      })
      .then(plotMarkers);
    map = new google.maps.Map(document.getElementById('map'), {
      center: {latitude: 32.397, longitude: -117.644},
      zoom: 8
    });
  }

  var markers;
  var bounds;

  function plotMarkers(m)
  {
    markers = [];
    bounds = new google.maps.LatLngBounds();

    m.forEach(function (marker) {
      var position = new google.maps.LatLng(marker.latitude, marker.longitude);

      markers.push(
        new google.maps.Marker({
          position: position,
          map: map,
          animation: google.maps.Animation.DROP
        })
      );

      bounds.extend(position);
    });

    map.fitBounds(bounds);
  }
