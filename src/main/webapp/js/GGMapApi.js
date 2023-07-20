/* global google */

var input1 = document.getElementById("from");
var autocomplete1 = new google.maps.places.Autocomplete(input1);

var input2 = document.getElementById("flat");
var autocomplete2 = new google.maps.places.Autocomplete(input2);


//javascript.js
//set map options
var myLatLng = { lat: 38.346, lng: -0.4907 };
var mapOptions = {
    center: myLatLng,
    zoom: 7,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
};

//create map
var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);


//create a DirectionsService object to use the route method and get a result for our request
var directionsService = new google.maps.DirectionsService();

//create a DirectionsRenderer object which we will use to display the route
var directionsDisplay = new google.maps.DirectionsRenderer();

//bind the DirectionsRenderer to the map
directionsDisplay.setMap(map);

//define calcRoute function
function calcRoute() {
     event.preventDefault();
    //create request
    var request = {
        origin: document.getElementById("from").value,
        destination: document.getElementById("flat").value,
        travelMode: google.maps.TravelMode.DRIVING, //WALKING, BYCYCLING, TRANSIT
        unitSystem: google.maps.UnitSystem.IMPERIAL,
    };

    //pass the request to the route method
    directionsService.route(request, function (result, status) {
        console.log(request)
        if (status == google.maps.DirectionsStatus.OK) {
            //Get distance and time
            const output = document.querySelector("#output");
            output.innerHTML =
                "<div class=''>"+
                "</div>";

            //display route
            directionsDisplay.setDirections(result);
        } else {
            //delete route from map
            directionsDisplay.setDirections({ routes: [] });
            //center map in London
            map.setCenter(myLatLng);

            //show error message
            output.innerHTML =
                "<div class='alert-danger'><i class='fas fa-exclamation-triangle'></i> Could not retrieve driving distance.</div>";
        }
    });
}
