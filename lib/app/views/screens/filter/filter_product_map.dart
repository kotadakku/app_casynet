import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/filter/filter_map_controller.dart';
import '../../theme/app_colors.dart';
import '../../widgets/appbar/appbar_account_widget.dart';

class FilterProductMap extends StatelessWidget {
  FilterProductMap({Key? key,}) : super(key: key);
  FilterMapController mapController = Get.put(FilterMapController());
  // StoresController _storesController = Get.find();


  @override
  Widget build(BuildContext context) {
    var _isCar = true.obs;
    final sellers = Get.arguments[0];

    return SafeArea(
      child: Scaffold(
        appBar: AppBarAccountWidget(),
        body: ListView(
          // physics: ,
          shrinkWrap: true,
          // mainAxisSize: MainAxisSize.max,
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
                            Text('car'.tr),
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
                            Text("motorcycle".tr)
                          ],
                        ))
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/home/store/icon_filter.svg",
                      width: 15,
                    ),

                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'filter'.tr,
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
            // Container(
            //   height: 300.0.h,
            //   child: GetBuilder<MapController>(
            //     init: MapController(),
            //     builder: (mapController) {
            //       return GoogleMap(
            //         onLongPress: (position) {
            //           print("${position.latitude} ${position.longitude}");
            //         },
            //         mapType: MapType.terrain,
            //         initialCameraPosition: mapController.currentLocationCamera,
            //         myLocationEnabled: true,
            //         markers: mapController.markers,
            //         onCameraMove: (position) {},
            //         onMapCreated: (GoogleMapController controller) {
            //           mapController.controller.complete(controller);
            //           mapController.googleMapController = controller;
            //           mapController.getStoresLocation(sellers);
            //         },
            //       );
            //     },
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset("assets/images/account/image_user.png"),
                  )),
                  title: Text(
                    'my_location'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "165 Vũ Phạm Hàm, Yên Hòa, Cầu Giấy...",
                    style: TextStyle(color: AppColors.textGrayColor, fontSize: 12),
                  ),
                  trailing: Text('edit'.tr,
                    style: TextStyle(color: AppColors.textLink),
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
            ),
            // ListView.builder(
            //     padding: const EdgeInsets.all(10),
            //     scrollDirection: Axis.vertical,
            //     shrinkWrap: true,
            //     // itemCount: ,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemBuilder: (context, index) {
            //       return Obx(()=>Container(
            //         height: 60,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 CircleAvatar(
            //                     child: ClipRRect(
            //                       borderRadius: BorderRadius.circular(20.0),
            //                       child: ImageNetworkLoading(
            //                         image_url: (sellers[index] as Seller)
            //                             .avatar_image
            //                             .toString(),
            //                         /*_seller.avatar_image.toString(),*/
            //                         fit: BoxFit.fill,
            //                       ), /*Image.asset("assets/images/account/image_user.png"),*/
            //                     )),
            //                 Column(
            //                   children: [
            //                     Text(
            //                       (sellers[index] as Seller).name == null
            //                           ? 'Chưa có thông tin'
            //                           : (sellers[index] as Seller)
            //                           .name
            //                           .toString(),
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.bold),
            //                     ),
            //                     Text(
            //                       (sellers[index] as Seller).address == null
            //                           ? 'Chưa có thông tin'
            //                           : (sellers[index] as Seller)
            //                           .address
            //                           .toString(),
            //                       style: TextStyle(
            //                           color: AppColors.textGrayColor, fontSize: 12),
            //                     ),
            //                   ],
            //                 ),
            //                 Text(
            //                   "Sửa",
            //                   style: TextStyle(color: AppColors.textLink),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ));
            //     }),
          ],
        ),
      ),
    );
  }
}
