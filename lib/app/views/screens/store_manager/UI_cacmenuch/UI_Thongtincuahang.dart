import 'package:app_casynet/app/controller/filter/map_controller.dart';
import 'package:app_casynet/app/controller/store_manager/seller/update_seller_controller.dart';
import 'package:app_casynet/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controller/home/api/region_controller.dart';
import '../../../theme/app_colors.dart';

class ThongTinCuaHang extends StatelessWidget {
  const ThongTinCuaHang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthdt = MediaQuery.of(context).size.width;

    UpdateSellerController controller = Get.find();
    RegionController _regionController = Get.find();
    MapController mapController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'info_seller'.tr,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formStateKeyShop,
            child: Column(
              children: [
                Image.network(
                    "https://xemaynghean.com/wp-content/uploads/2019/03/50272791_137653880484230_7970165378053570560_n-1024x554.jpg"),
                SizedBox(
                    height: 50,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          Text(
                            'name_s'.tr,
                            style: const TextStyle(
                              color: AppColors.textGrayBoldColor,
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.black,
                              textAlign: TextAlign.end,
                              onSaved: (value) {
                                if(value?.trim() != ''){
                                  controller.seller.name = value?.trim();
                                }
                                // if()
                              },
                              validator: (value){
                                if(value?.trim() == ''){
                                  return 'required_field'.tr;
                                }
                              },
                              decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                  border: InputBorder.none,
                                  hintText: 'enter_name'.tr,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                                  ),
                            ),
                          )
                        ],
                      )),
                ),
                const Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Link",
                          style: TextStyle(
                            color: AppColors.textGrayBoldColor,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "",
                                suffixIcon: SizedBox(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: AppColors.textGrayBoldColor,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                const Divider(
                  indent: 10,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'phone'.tr,
                          style: const TextStyle(
                            color: AppColors.textGrayBoldColor,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              controller.seller.phone = value?.trim();
                              // if()
                            },
                            validator: (value){
                              if(value?.trim() == ''){
                                return 'required_field'.tr;
                              }
                              if (!RegExp(r"^0[0-9]{9}$").hasMatch(value!)) {
                                return "Số điện thoại không hợp lệ";
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,

                                hintText: "enter_phone".tr,
                                isDense: true,
                                contentPadding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                            ),
                          ),
                        )
                      ],
                    )),
                const Divider(
                  indent: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.0.w, right: 5.0.w),
                      height: 50,
                      width: widthdt / 2 - 1.0.w,
                      child: InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Text('open_time'.tr,
                                  style: const TextStyle(
                                      fontSize: 15, color: AppColors.textGrayBoldColor)),
                            ),
                            Obx(
                              () => Text(
                                  controller.open_hours.value == ""
                                      ? ""
                                      : controller.open_hours.value,
                                  style: const TextStyle(fontSize: 15)),
                            ),
                            const Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 0, 74, 165),
                              size: 15,
                            ),
                          ],
                        ),
                        onTap: () async {
                          FocusManager.instance.primaryFocus!.unfocus();
                          controller.showDateTimePicker(context, isOpen: true);
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 1.0.h, bottom: 1.0.h),
                      color: Colors.black12,
                      width: 1.0.w,
                      height: 50.0.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 5.0.w, right: 15.0.w),
                      height: 50,
                      width: widthdt / 2 - 1.0.w,
                      child: InkWell(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text('close_time'.tr,
                                  style: const TextStyle(
                                      fontSize: 15, color: AppColors.textGrayBoldColor)),
                            ),
                            Obx(
                              () => Text(
                                  controller.closer_hours.value == null
                                      ? ""
                                      : controller.closer_hours.value,
                                  style: const TextStyle(fontSize: 15)),
                            ),
                            const Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 0, 74, 165),
                              size: 15,
                            ),
                          ],
                        ),
                        onTap: () async {
                          FocusManager.instance.primaryFocus!.unfocus();

                          controller.showDateTimePicker(context);

                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  color: const Color.fromARGB(255, 243, 242, 255),
                  height: 15.0.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'address'.tr,
                            style:
                                const TextStyle(fontSize: 15, color: AppColors.textGrayBoldColor),
                          ),
                        ),
                        Obx(
                          () => Text(
                              controller.provinceShop.value == ""
                                  ? 'select_province'.tr
                                  : controller.provinceShop.value,
                              style: const TextStyle(fontSize: 15)),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: AppColors.textGrayBoldColor,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () async {
                      FocusManager.instance.primaryFocus!.unfocus();
                      var value = await Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn tỉnh/ thành phố",
                        "regions": _regionController.provinces
                      });
                      if (value != null) {
                        controller.provinceShop.value = value.name;
                        _regionController.getDistrictsApi(value.id);
                        controller.address.provinceId = value.id;
                        controller.districtShop.value = "";
                        controller.communeShop.value = "";
                      }
                    },
                  ),
                ),
                const Divider(
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                  height: 50.0.h,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('district'.tr,
                              style: const TextStyle(
                                  fontSize: 15, color: AppColors.textGrayBoldColor)),
                        ),
                        Obx(
                          () => Text(
                              controller.districtShop.value == ""
                                  ? 'select_district'.tr
                                  : controller.districtShop.value,
                              style: const TextStyle(fontSize: 15)),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: AppColors.textGrayBoldColor,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () async {
                      FocusManager.instance.primaryFocus!.unfocus();
                      var value = await Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": 'select_district'.tr,
                        "regions":  _regionController.districts
                      });
                      if (value != null) {
                        controller.districtShop.value = value.name;
                        controller.address.districtId = value.id;
                        _regionController.getVillagesApi(value.id);
                        controller.communeShop.value = "";
                      }
                    },
                  ),
                ),
                const Divider(
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                  height: 50.0.h,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('village'.tr,
                              style: const TextStyle(
                                  fontSize: 15, color: AppColors.textGrayBoldColor)),
                        ),
                        Obx(
                          () => Text(
                              controller.communeShop.value == ""
                                  ? 'select_village'.tr
                                  : controller.communeShop.value,
                              style: const TextStyle(fontSize: 15)),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: AppColors.textGrayBoldColor,
                          size: 20,
                        ),
                      ],
                    ),
                    onTap: () async {
                      FocusManager.instance.primaryFocus!.unfocus();
                      var value = await Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": 'select_village'.tr,
                        "regions": _regionController.communes
                      });
                      if (value != null) {
                        controller.communeShop.value = value.name;
                        controller.address.villageId = value.id;
                      }
                    },
                  ),
                ),
                const Divider(
                  indent: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Text(
                        'apartment_street'.tr,
                        style: const TextStyle(color: AppColors.textGrayBoldColor),
                      ),
                      Expanded(
                          child: TextFormField(
                        cursorColor: AppColors.textGrayBoldColor,
                        textAlign: TextAlign.end,

                        onSaved: (value) {
                          controller.address.specificAddress = value;
                        },
                        onFieldSubmitted: (value){
                          if(value!= null){
                            FocusManager.instance.primaryFocus!.unfocus();
                            mapController.addMarkerByAddress(value);
                          }
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'enter_apartment_street'.tr,
                      )
                          )
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  height: 300,
                  child: GetBuilder<MapController>(
                    init: MapController(),
                    builder: (mapController){
                      return GoogleMap(
                        onLongPress: (position){
                          print("${position.latitude} ${position.longitude}");
                          mapController.pinMarker(position);
                          controller.lon = position.longitude;
                          controller.lat = position.latitude;
                        },
                        markers: mapController.markers,
                        mapType: MapType.terrain,
                        initialCameraPosition: mapController.currentLocationCamera,
                        myLocationEnabled: true,

                        onCameraMove: (position){

                        },
                        gestureRecognizers: Set()..add(Factory<VerticalDragGestureRecognizer>(
                                () => VerticalDragGestureRecognizer()
                        )),
                        scrollGesturesEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          mapController.controller.complete(controller);
                          mapController.googleMapController = controller;

                        },
                      );
                    },
                  )
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 15.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('main_category'.tr,
                              style: const TextStyle(fontSize: 15, color: AppColors.textGrayBoldColor)),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: const Text(
                            "Mua bán xe",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                const Divider(
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w, right: 20.0.w),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'main_category'.tr,
                            style:
                            const TextStyle(fontSize: 15, color: AppColors.textGrayBoldColor),
                          ),
                        ),
                        Obx(()=>
                        controller.listCategorySelected.value.isNotEmpty
                            ? Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: controller.listCategorySelected.value.length,
                                reverse: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    alignment: Alignment.centerRight,
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(right: 10, left: 10),
                                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                                          height: 40,
                                          child: Center(
                                            child: Text(controller.listCategorySelected[index].name
                                                .toString()),
                                          ),
                                          color:
                                          const Color.fromARGB(255, 241, 243, 253),
                                        ),
                                        Positioned(
                                            width: 20,
                                            height: 20,
                                            right: 0,
                                            top: 0,
                                            child: FloatingActionButton(
                                              heroTag: '${index}',
                                              child: const Icon(Icons.close, size: 8,),
                                              onPressed: (){
                                                controller.listCategorySelected
                                                    .removeAt(index);
                                              },
                                            )
                                        ),
                                      ],
                                    ),
                                  );
                                })
                        )
                            : Row(
                          children: [
                            Text(
                              'select_category'.tr,
                              textAlign: TextAlign.end,
                            ),
                            const Icon(Icons.navigate_next),
                          ],
                        )
                        ),
                        // Text(
                        //     'select_category'.tr/*controllerCate.chooseCategory.toString()*/,
                        //     style: TextStyle(fontSize: 15)),
                        // Icon(
                        //   Icons.navigate_next,
                        //   color: AppColors.textGrayBoldColor,
                        //   size: 20,
                        // ),
                      ],
                    ),
                    onTap: () async {
                      FocusManager.instance.primaryFocus!.unfocus();
                      var value = await Get.toNamed(Routes.STORE_MANAGER_SELECT_CATEGORY,
                        arguments: [controller.listCategorySelected.value]
                      );
                      if(value != null){
                        controller.listCategorySelected.clear();
                        controller.listCategorySelected.addAll(value);
                      }
                    },
                  ),
                ),
                const Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'type_seller'.tr,
                          style: const TextStyle(
                            color: AppColors.textGrayBoldColor,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "motorcycle".tr,
                                hintStyle: const TextStyle(color: Colors.black),
                                suffixIcon: SizedBox(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: AppColors.textGrayBoldColor,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                const Divider(
                  indent: 10,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                  height: 145,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('introduce_seller'.tr, style: const TextStyle(color: AppColors.textGrayBoldColor, fontSize: 15),),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: const ImageIcon(
                              AssetImage("assets/images/Icon/icon_butchi.png"),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TextFormField(
                        maxLines: 5,
                        onSaved: (value){
                          controller.seller.description = value;
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'enter_descrip_seller'.tr,
/*                          fillColor: Colors.red,*/

                        ),
                      ),)
                    ],
                  ),
                ),
                const Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Loại giao diện",
                          style: TextStyle(
                            color: AppColors.textGrayBoldColor,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "NCI CASYNET",
                                hintStyle: const TextStyle(color: Colors.black),
                                suffixIcon: SizedBox(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: AppColors.textGrayBoldColor,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                const Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "SĐT Zalo",
                          style: TextStyle(
                            color: AppColors.textGrayBoldColor,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: 'enter_phone'.tr,
                                hintStyle: const TextStyle(color: Colors.black),
                                suffixIcon: SizedBox(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: AppColors.textGrayBoldColor,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),
                const Divider(
                  indent: 10,
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: 10.0.w,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Mã cộng tác viên",
                          style: TextStyle(
                            color: AppColors.textGrayBoldColor,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.black,
                            textAlign: TextAlign.end,
                            onSaved: (value) {
                              // if()
                            },
                            decoration: InputDecoration(
                              // contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "bht123456",
                                hintStyle: const TextStyle(color: Colors.black),
                                suffixIcon: SizedBox(
                                  height: 10.0.h,
                                  width: 10.0.w,
                                  child: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: AppColors.textGrayBoldColor,
                                  ),
                                )),
                          ),
                        )
                      ],
                    )),

                Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 20, top: 20),
                  width: widthdt,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255,222, 180, 0),
                    ),
                    child: Text(
                      'save_info'.tr,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onPressed: () {
                      controller.saveSeller();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Bottommenu(),
    );
  }
}
