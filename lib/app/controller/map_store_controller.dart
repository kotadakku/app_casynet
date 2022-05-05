import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapStoreController extends GetxController{
  Completer<GoogleMapController> controller = Completer();
  late GoogleMapController googleMap;//contrller for Google map
  final Set<Marker> markers = new Set();
  LatLng showLocation = const LatLng(21.021269086008136, 105.83777770400047);
  late Position _currentPosition;
  var isLoading = true;
  @override
  void onInit() {
    super.onInit();
    _getLocation();

  }

  _getLocation() async {

    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        googleMap.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
    }).catchError((e) {
      print(e);
    });

  }

  void getStoreLocation(String address, String name) async {
    List<Location> destinationPlacemark = await locationFromAddress(address);
    //markers to place on map

    double destinationLatitude = destinationPlacemark[0].latitude;
    double destinationLongitude = destinationPlacemark[0].longitude;
    String destinationCoordinatesString = '($destinationLatitude, $destinationLongitude)';
    // Start Location Marker

    print(destinationCoordinatesString);
    Marker destinationMarker = Marker(
      markerId: MarkerId(destinationCoordinatesString),
      position: LatLng(destinationLatitude, destinationLongitude),
      infoWindow: InfoWindow(
        title: name,
        snippet: address,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
    markers.add(destinationMarker);

    googleMap.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(destinationLatitude, destinationLongitude),
          zoom: 15.0,
        ),
      ),
    );
    isLoading = false;
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