$(function() {
  $('#tabList a').click(function (e) {
    e.preventDefault()
    $(this).tab('show')
  })
  
  $('.carousel').carousel({
    interval: 5000
  })

  $('[data-toggle="popover"]').popover();
  
 
  map = new GMaps({
    div: '#map-canvas',
    zoom: 13,
    lat: 51.415782,
    lng: -1.325848,
    width: 500,
    height: 300
  });

  map.addMarker({
    lat: 51.415782,
    lng: -1.325848,
    title: 'Bickleigh Ridge Ltd.',
    infoWindow: {
      content: '<p>Bickleigh Ridge Ltd.</p>'
    }
  });



  $('a[href="#contact"]').click(function(e) {
    setTimeout(initialise, 500);
  });

  function initialise() {
    var myMap = document.getElementById('map-canvas');
    google.maps.event.trigger(myMap, 'resize');
    map.setCenter(51.415782, -1.325848);
  };

});



