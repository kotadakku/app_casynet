
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/filter_map_controller.dart';
import '../../../controller/map_controller.dart';
import '../account/widgets/appbar_account_widget.dart';
import '../../theme/app_colors.dart';



class FilterProductMap extends StatelessWidget {
  const FilterProductMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isCar = true.obs;
    final sellers = Get.arguments[0];


    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(21.021269086008136, 105.83777770400047),
      zoom: 14.4746,
    );

    return SafeArea(
        child: Scaffold(
          appBar:  AppBarAccountWidget(),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(child: CircleAvatar(
                        child: Text(
                          "123",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        backgroundColor: Color(0xffDFB400),
                      ),),
                      Obx(()=>Row(
                        children: [
                          Radio(
                              value: true,
                              groupValue: _isCar.value,
                              onChanged: (value){
                                _isCar.value = !_isCar.value;
                              },
                              activeColor: Color(0xffDFB400)),
                          Text("Ô tô"),
                          SizedBox(width: 20,),
                          Radio(
                              value: false,
                              groupValue: _isCar.value,
                              onChanged: (value){
                                _isCar.value = !_isCar.value;
                              },
                              activeColor: Color(0xffDFB400)
                          ),

                          Text("Xe máy")
                        ],
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/images/home/store/icon_filter.svg", width: 15,),
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
                          color: kTextColor_gray,
                          fontSize: 12
                      ),
                    ),
                    trailing: Text("Sửa",
                      style: TextStyle(
                          color: kTextLink
                      ),
                    ),
                  ),
                  Divider(
                      height: 5
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text("Danh sách cửa hàng bạn cần tìm",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),
                    ),

                  ),
                  Divider(
                      height: 5
                  ),
                  GetBuilder<FilterMapController>(
                    init: FilterMapController(),
                    builder: (controller){
                      return GestureDetector(
                        onTap: (){
                          controller.add();

                        },
                        child: ListTile(
                        leading: CircleAvatar(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset("assets/images/account/image_user.png"),
                            )
                        ),
                        title: Text("Gara Ô Tô Hà Nội Car Sevices"),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("số 2 Phố Trần Hữu Dực, Mỹ Đình, Từ Liêm, Hà Nội",
                              style: TextStyle(
                                  color: kTextColor_gray,
                                  fontSize: 12
                              ),
                            ),
                            Row(children: [
                              Container(
                                height: 20,
                                width: 20,
                                margin: EdgeInsets.all(5.0),
                                child: Icon(Icons.add),
                              ),
                              Text("Vào cửa hàng"),
                            ],)
                          ],
                        ),
                      ),
                      );
                    }
                  )


                ],
              )



            ],
          ),
        )
    );
  }
}
