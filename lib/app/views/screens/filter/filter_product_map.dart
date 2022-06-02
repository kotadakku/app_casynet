import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/filter/filter_map_controller.dart';
import '../../../controller/filter/map_controller.dart';
import '../account/widgets/appbar_account_widget.dart';
import '../../theme/app_colors.dart';

import 'package:geolocator/geolocator.dart';

class FilterProductMap extends StatelessWidget {
  FilterProductMap({Key? key}) : super(key: key);
  FilterMapController mapController = Get.put(FilterMapController());


  @override
  Widget build(BuildContext context) {
    var _isCar = true.obs;
    final sellers = Get.arguments[0];


    return SafeArea(
        child: Scaffold(
      appBar: AppBarAccountWidget(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: CircleAvatar(
                      child: Text(
                        "123",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Color(0xffDFB400),
                    ),
                  ),
                  Obx(() => Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _isCar.value,
                              onChanged: (value) {
                                _isCar.value = !_isCar.value;
                              },
                              activeColor: Color(0xffDFB400)),
                          Text("Ô tô"),
                          SizedBox(
                            width: 20,
                          ),
                          Radio(
                              value: false,
                              groupValue: _isCar.value,
                              onChanged: (value) {
                                _isCar.value = !_isCar.value;
                              },
                              activeColor: Color(0xffDFB400)),
                          Text("Xe máy")
                        ],
                      ))
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/home/store/icon_filter.svg",
                    width: 15,),
                      SizedBox(width: 5,),
                      Text(
                        "Lọc",
                        style: TextStyle(
                          color: Color(0xffB7BAC1),
                        ),
                      ),
                      SizedBox(width: 10,)
                    ],
                  )
                ],
              ),
              Expanded(
                child: GetBuilder<MapController>(
                  init: MapController(),
                  builder: (mapController){
                    return GoogleMap(
                      onLongPress: (position){
                        print("${position.latitude} ${position.longitude}");
                      },
                      mapType: MapType.terrain,
                      initialCameraPosition: mapController.currentLocationCamera,
                      myLocationEnabled: true,
                      markers: mapController.markers,
                      onCameraMove: (position){

                      },
                      onMapCreated: (GoogleMapController controller) {
                        mapController.controller.complete(controller);
                        mapController.googleMapController = controller;
                        mapController.getStoresLocation(sellers);
                      },
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset("assets/images/account/image_user.png"),
                        )
                    ),
                    title: Text("Vị trí của tôi", style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),),
                    subtitle: Text("165 Vũ Phạm Hàm, Yên Hòa, Cầu Giấy...",
                      style: TextStyle(
                          color: AppColors.textGrayBoldColor,
                          fontSize: 12
                      ),
                    ),
                    trailing: Text("Sửa",
                      style: TextStyle(
                          color: AppColors.textLink
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Lọc",
                    style: TextStyle(
                      color: Color(0xffB7BAC1),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          ),
      ),
    );
  }
}
