import 'dart:async';

import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../data/model/seller.dart';
import '../../data/model/seller.dart';

class MapController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  GoogleMapController? googleMapController;
  late LocationData _currentLocation;
  late LocationData currentLocationData;
  LatLng currentLocation = LatLng(21.021269086008136, 105.83777770400047);
  Location location = new Location();
  final Set<Marker> markers = Set();
  late CameraPosition currentLocationCamera = CameraPosition(
    target: LatLng(21.021269086008136, 105.83777770400047),
    zoom: 14.4746,
  );

  @override
  void onInit() {
    _getCurrentLocation();
  }

  // location.enableBackgroundMode(enable: true);
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  void checkPermissionLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  _getCurrentLocation() async {
    currentLocationData = await location.getLocation();
    if(currentLocationData != null){
      currentLocation =
          LatLng(currentLocationData.latitude!,
          currentLocationData.longitude!);
    }
    location.onLocationChanged.listen((LocationData currentLocation) {
      // googleMapController.animateCamera(
      //     CameraUpdate.newCameraPosition(new CameraPosition(
      //       target: LatLng(currentLocation.latitude ?? 0.0,
      //           currentLocation.longitude ?? 0.0),
      //       zoom: 12.0,
      //     )));
      // Marker destinationMarker = Marker(
      //   markerId: MarkerId("Home"),
      //   position: LatLng(
      //       currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0),
      //   infoWindow: InfoWindow(
      //     // title: name,
      //     // snippet: address,
      //   ),
      //   icon: BitmapDescriptor.defaultMarker,
      // );
      // markers.add(destinationMarker);
    });

    update();
  }

  void getLocationStore(
      String address, String name, double lat, double lon) async {
    String destinationCoordinatesString = '($lat, $lon)';

    print(destinationCoordinatesString);
    Marker destinationMarker = Marker(
      markerId: MarkerId(destinationCoordinatesString),
      position: LatLng(lat, lon),
      infoWindow: InfoWindow(
        title: name,
        snippet: address,
      ),
      icon: BitmapDescriptor.defaultMarker,
    );
    markers.clear();
    markers.add(destinationMarker);

    googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lon),
          zoom: 15.0,
        ),
      ),
    );
    update();
  }

  void getStoreLocation(String address, String name) async {
    List<geocoding.Location> destinationPlacemark =
        await geocoding.locationFromAddress(address);

    //markers to place on map

    double destinationLatitude = destinationPlacemark[0].latitude;
    double destinationLongitude = destinationPlacemark[0].longitude;
    String destinationCoordinatesString =
        '($destinationLatitude, $destinationLongitude)';
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

    googleMapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(destinationLatitude, destinationLongitude),
          zoom: 15.0,
        ),
      ),
    );
    update();
  }

  void getStoresLocation(List<Seller> sellers) {
    double min_lat = 2000.0;
    double max_lat = 0.0;
    double min_lon = 2000.0;
    double max_lon = 0.0;
    markers.clear();

    sellers.forEach((seller) {
      String destinationCoordinatesString = '(${seller.lat}, ${seller.lon})';
      if(min_lat> seller.lat!){
        min_lat = seller.lat!;
      }
      if(min_lon> seller.lon!){
        min_lon = seller.lon!;
      }
      if(max_lat< seller.lat!){
        max_lat = seller.lat!;
      }
      if(max_lon< seller.lon!){
        max_lon = seller.lon!;
      }


      print(destinationCoordinatesString);
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(seller.lat!, seller.lon!),
        infoWindow: InfoWindow(
          title: seller.name,
          snippet: seller.address,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers.add(destinationMarker);
    });
    update();
    googleMapController?.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(min_lat, min_lon),
          southwest: LatLng(max_lat, max_lon),
        ),
       0.0
      ),
    );
  }

// Future<bool> _calculateDistance() async {
//   try {
//     // Retrieving placemarks from addresses
//     List<Location> startPlacemark = await locationFromAddress(_startAddress);
//     List<Location> destinationPlacemark = await locationFromAddress(_destinationAddress);
//
//     // Use the retrieved coordinates of the current position,
//     // instead of the address if the start position is user's
//     // current position, as it results in better accuracy.
//     double startLatitude = _startAddress == _currentAddress
//         ? _currentPosition.latitude
//         : startPlacemark[0].latitude;
//
//     double startLongitude = _startAddress == _currentAddress
//         ? _currentPosition.longitude
//         : startPlacemark[0].longitude;
//
//     double destinationLatitude = destinationPlacemark[0].latitude;
//     double destinationLongitude = destinationPlacemark[0].longitude;
//
//     String startCoordinatesString = '($startLatitude, $startLongitude)';
//     String destinationCoordinatesString = '($destinationLatitude, $destinationLongitude)';
//
//     // Start Location Marker
//     Marker startMarker = Marker(
//       markerId: MarkerId(startCoordinatesString),
//       position: LatLng(startLatitude, startLongitude),
//       infoWindow: InfoWindow(
//         title: 'Start $startCoordinatesString',
//         snippet: _startAddress,
//       ),
//       icon: BitmapDescriptor.defaultMarker,
//     );
//
//     // Destination Location Marker
//     Marker destinationMarker = Marker(
//       markerId: MarkerId(destinationCoordinatesString),
//       position: LatLng(destinationLatitude, destinationLongitude),
//       infoWindow: InfoWindow(
//         title: 'Destination $destinationCoordinatesString',
//         snippet: _destinationAddress,
//       ),
//       icon: BitmapDescriptor.defaultMarker,
//     );
//
//     // Adding the markers to the list
//     markers.add(startMarker);
//     markers.add(destinationMarker);
//
//     print(
//       'START COORDINATES: ($startLatitude, $startLongitude)',
//     );
//     print(
//       'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
//     );
//
//     // Calculating to check that the position relative
//     // to the frame, and pan & zoom the camera accordingly.
//     double miny = (startLatitude <= destinationLatitude)
//         ? startLatitude
//         : destinationLatitude;
//     double minx = (startLongitude <= destinationLongitude)
//         ? startLongitude
//         : destinationLongitude;
//     double maxy = (startLatitude <= destinationLatitude)
//         ? destinationLatitude
//         : startLatitude;
//     double maxx = (startLongitude <= destinationLongitude)
//         ? destinationLongitude
//         : startLongitude;
//
//     double southWestLatitude = miny;
//     double southWestLongitude = minx;
//
//     double northEastLatitude = maxy;
//     double northEastLongitude = maxx;
//
//     // Accommodate the two locations within the
//     // camera view of the map
//     mapController.animateCamera(
//       CameraUpdate.newLatLngBounds(
//         LatLngBounds(
//           northeast: LatLng(northEastLatitude, northEastLongitude),
//           southwest: LatLng(southWestLatitude, southWestLongitude),
//         ),
//         100.0,
//       ),
//     );
//
//     // Calculating the distance between the start and the end positions
//     // with a straight path, without considering any route
//     // double distanceInMeters = await Geolocator.bearingBetween(
//     //   startLatitude,
//     //   startLongitude,
//     //   destinationLatitude,
//     //   destinationLongitude,
//     // );
//
//     await _createPolylines(startLatitude, startLongitude, destinationLatitude,
//         destinationLongitude);
//
//     double totalDistance = 0.0;
//
//     // Calculating the total distance by adding the distance
//     // between small segments
//     for (int i = 0; i < polylineCoordinates.length - 1; i++) {
//       totalDistance += _coordinateDistance(
//         polylineCoordinates[i].latitude,
//         polylineCoordinates[i].longitude,
//         polylineCoordinates[i + 1].latitude,
//         polylineCoordinates[i + 1].longitude,
//       );
//     }
//
//     setState(() {
//       print("setSTate");
//       print('${totalDistance.toStringAsFixed(2)}');
//       _placeDistance = totalDistance.toStringAsFixed(2);
//       print('DISTANCE: $_placeDistance km');
//     });
//
//     return true;
//   } catch (e) {
//     print(e);
//   }
//   return false;
// }
//
// // Formula for calculating distance between two coordinates
// // https://stackoverflow.com/a/54138876/11910277
// double _coordinateDistance(lat1, lon1, lat2, lon2) {
//   var p = 0.017453292519943295;
//   var c = cos;
//   var a = 0.5 -
//       c((lat2 - lat1) * p) / 2 +
//       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
//   return 12742 * asin(sqrt(a));
// }

// Create the polylines for showing the route between two places
// _createPolylines(
//     double startLatitude,
//     double startLongitude,
//     double destinationLatitude,
//     double destinationLongitude,
//     ) async {
//   polylinePoints = PolylinePoints();
//   try{
//     PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
//       'AIzaSyDc7PnOq3Hxzq6dxeUVaY8WGLHIePl0swY', // Google Maps API Key
//       PointLatLng(startLatitude, startLongitude),
//       PointLatLng(destinationLatitude, destinationLongitude),
//       travelMode: TravelMode.walking,
//     ).then((value) {
//       print("point ${value.points}");
//       return value;
//
//     }).catchError((error){print(error);});
//
//
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }
//   }catch(e){
//     print(e);
//   }
//
//
//
//
//   PolylineId id = PolylineId('poly');
//   Polyline polyline = Polyline(
//     polylineId: id,
//     color: Colors.red,
//     points: polylineCoordinates,
//     width: 3,
//   );
//   polylines[id] = polyline;
// }
}
