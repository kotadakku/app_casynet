
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/map_store_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_colors.dart';


class StoreMapPage extends StatelessWidget {
  const StoreMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(21.021269086008136, 105.83777770400047),
      zoom: 14.4746,
    );
    String store_name = Get.arguments['name'];
    String store_address = Get.arguments['address'];
    double lat = Get.arguments['lat'];
    double lon = Get.arguments['lon'];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, color: kTextColor,),
          ),
          title: Text("Bản đồ đến cửa hàng", style: TextStyle(
            color: Colors.black
          ),),
        ),
        body: GetBuilder<MapStoreController>(
            init: MapStoreController(),
            builder: (c){

              return Stack(
                children: [

                  GoogleMap(
                    onLongPress: (position){
                      print("${position.latitude} ${position.longitude}");
                    },
                    markers: c.markers,
                    mapType: MapType.terrain,
                    initialCameraPosition: _kGooglePlex,
                    myLocationEnabled: true,
                    onCameraMove: (position){

                    },
                    onMapCreated: (GoogleMapController controller) {
                      c.controller.complete(controller);
                      c.googleMap = controller;
                      if(lat != null && lon != null){
                        c.getLocationLatLon(store_address, store_name, lat, lon);
                      }
                      else c.getStoreLocation(store_address, store_name);

                    },
                  ),
                  Positioned(
                      left: 10.0,
                      bottom: 10.0,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text("XEM CHỈ ĐƯỜNG"),
                        style: ElevatedButton.styleFrom(
                          primary: kYellowColor,

                        ),
                      )
                  ),
                  if(c.isLoading) Center(
                    child: CircularProgressIndicator(
                    ),
                  ),
                ],
              );
            }),
      )
    );
  }
}
