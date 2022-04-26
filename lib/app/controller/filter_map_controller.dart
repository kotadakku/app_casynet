import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class FilterMapController extends GetxController{
  Completer<GoogleMapController> controller = Completer();
  late GoogleMapController googleMap;//contrller for Google map
  final Set<Marker> markers = new Set();
  LatLng showLocation = const LatLng(21.021269086008136, 105.83777770400047);
  late LatLng location_current;
  @override
  void onInit() {


    super.onInit();
    getmarkers();
    getLocation();
  }

  getLocation() async {

    var location = new Location();
    location.onLocationChanged.listen((currentLocation) {
      print("Location");
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      location_current = LatLng(currentLocation.latitude!, currentLocation.longitude!);
    });

  }

  void getmarkers() { //markers to place on map
    markers.add(Marker( //add first marker
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Marker Title First ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    markers.add(Marker( //add second marker
      markerId: MarkerId(showLocation.toString()),
      position: LatLng(21.021896261750573, 105.84508337080479), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Marker Title Second ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    markers.add(Marker( //add third marker
      markerId: MarkerId(showLocation.toString()),
      position: LatLng(21.021594879724592, 105.84330406039952), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Marker Title Third ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    update();
  }

  void add(){
    googleMap.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(markers.elementAt(1).position.latitude, markers.elementAt(1).position.longitude), zoom: 15.0),
      ),
    );
  }
}