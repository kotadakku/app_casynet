import 'dart:io';
// import 'dart:ui';

import 'package:app_casynet/app/controller/store/other_category_controller.dart';
import 'package:app_casynet/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/store/create_seller_controller.dart';
import '../../views.dart';

class NewCreatedStore extends StatelessWidget {
  NewCreatedStore({Key? key}) : super(key: key);

  final CreateSellerController _createSellerController = Get.find();
  final OtherCategoryController chooseCategory = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tạo mới cửa hàng",
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Obx(
              () => Form(
                key: _createSellerController.formKey,
                child: Column(
                  children: [
                    Center(
                        child: Column(
                      children: [
// Ảnh đại diện
                        Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 150.0.h,
                              child: Obx(() => _createSellerController
                                          .imgBackground_selected.value ==
                                      ""
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 150.0.h,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: RadialGradient(
                                          colors: [
                                            Colors.grey,
                                            Colors.white
                                          ],
                                        ),
                                      ),
                                    )
                                  : Image.file(File(_createSellerController
                                      .imgBackground_selected.value))),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Obx(
                                () => _createSellerController
                                            .image_selected.value ==
                                        ""
                                    ? Container(
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/store/ic_thongbao_email.png"),
                                              // mage.file(),
                                            ),
                                            shape: BoxShape.circle),
                                        width: 100,
                                        height: 100,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            showActionSheet(
                                              context,
                                              "Sửa hình đại diện",
                                            );
                                          },
                                          child: Text(
                                            'edit'.tr,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                width: 2.0,
                                                color: Color.fromARGB(
                                                    255, 223, 180, 0)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            elevation: 10,
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                          ),
                                        ),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: FileImage(File(
                                                    _createSellerController
                                                        .image_selected
                                                        .value))),
                                            shape: BoxShape.circle),
                                        width: 100,
                                        height: 100,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            // _tripEditModalBottomSheet(context, (value){
                                            //   //gan = value
                                            // });
                                            showActionSheet(
                                              context,
                                              "Sửa hình đại diện",
                                            );
                                          },
                                          child: Text(
                                            'edit'.tr,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                width: 2.0,
                                                color: Color.fromARGB(
                                                    255, 223, 180, 0)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            elevation: 10,
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          alignment: Alignment.center,
                          color: const Color.fromARGB(255, 96, 88, 57),
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              showActionSheetBackground(
                                  context, "Sửa hình nền");
                            },
                            child: const Text(
                              "Chạm để thay đổi",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                    Column(
                      children: [
//Nhập Tên cửa hàng
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                  child: Text("Tên cửa hàng",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 127, 141, 171)))),
                              Expanded(
                                child: TextFormField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.right,
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  onSaved: (value) {
                                    _createSellerController.seller.name = value;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    // enabledBorder: OutlineInputBorder(),
                                    // suffixIcon: Icon(Icons.navigate_next),

                                    hintText: 'Nhập tên cửa hàng',
                                  ),
                                  onTap: () {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Nhập link cửa hàng
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                  child: Text("Đường link cửa hàng",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 127, 141, 171)))),
                              Expanded(
                                  child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                textAlign: TextAlign.right,
                                onEditingComplete: () {
                                  FocusScope.of(context).nextFocus();
                                },
                                onSaved: (value) {},
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "VD: Garaptp_bao_viet",
                                  // labelText: "VD: Garaptp_bao_viet",
                                ),
                                onTap: () {
                                  // FocusManager.instance.primaryFocus?.unfocus();
                                },
                              ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Số điện thoại
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Text('phone'.tr,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 127, 141, 171)))),
                              Expanded(
                                child: TextFormField(
                                  autofocus: false,
                                  maxLength: 11,
                                  maxLines: 1,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  textAlign: TextAlign.right,
                                  onEditingComplete: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  onSaved: (value) {
                                    _createSellerController.seller.phone =
                                        value;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    // suffixIcon: Icon(Icons.navigate_next),
                                    counterText: "",
                                    // hide counter
                                    hintText: 'enter_phone'.tr,
                                  ),
                                  onTap: () {
                                    // FocusManager.instance.primaryFocus?.unfocus();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Giờ mở cửa
                        Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                              onTap: () async {
                                TimeOfDay? value = await showTimePicker(
                                  context: context,
                                  builder: (context, childWidget) {
                                    return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            // Using 24-Hour format
                                            alwaysUse24HourFormat: true),
                                        // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
                                        child: childWidget!);
                                  },
                                  initialTime: TimeOfDay.now(),
                                );
                                _createSellerController.open_time.value =
                                    '${value?.hour}:${value?.minute}';
                                _createSellerController.seller.timeOpen =
                                    '${value?.hour}:${value?.minute}';
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('time_open'.tr,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 127, 141, 171)))
                                    ],
                                  )),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Obx(
                                        () => Text(
                                          _createSellerController
                                                      .open_time.value ==
                                                  ""
                                              ? "Thiết lập"
                                              : _createSellerController
                                                  .open_time.value,
                                        ),
                                      ),
                                      const Icon(Icons.navigate_next),
                                    ],
                                  ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Giờ đóng cửa
                        Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () async {
                                TimeOfDay? value = await showTimePicker(
                                  context: context,
                                  builder: (context, childWidget) {
                                    return MediaQuery(
                                        data: MediaQuery.of(context).copyWith(
                                            // Using 24-Hour format
                                            alwaysUse24HourFormat: true),
                                        // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
                                        child: childWidget!);
                                  },
                                  initialTime: TimeOfDay.now(),
                                );
                                _createSellerController.close_time.value =
                                    '${value?.hour}:${value?.minute}';
                                _createSellerController.seller.timeClose =
                                    '${value?.hour}:${value?.minute}';
                              },

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // giờ đóng cửa
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('time_close'.tr,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 127, 141, 171)))
                                    ],
                                  )),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Obx(
                                        () => Text(
                                          _createSellerController
                                                      .close_time.value ==
                                                  ""
                                              ? "Thiết lập"
                                              : _createSellerController
                                                  .close_time.value,
                                        ),
                                      ),
                                      const Icon(Icons.navigate_next),
                                    ],
                                  ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Danh mục ngành nghề chính
                        Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {
                                Get.toNamed(Routes.MY_STORE_MAINCATEGORY);
                              },

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text('main_category'.tr,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 127, 141, 171)))
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        chooseCategory.chooseMainCategory
                                            .toString(),
                                      ),
                                      const Icon(Icons.navigate_next),
                                    ],
                                  ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Danh mục nghề khác
                        Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () async {
                                FocusManager.instance.primaryFocus!.unfocus();
                                var value = await Get.toNamed(
                                    Routes.MY_STORE_CATEGORY,
                                    arguments: [
                                      _createSellerController
                                          .listOtherCateSelected.value
                                    ]);
                                if (value != null) {
                                  _createSellerController.listOtherCateSelected
                                      .clear();
                                  _createSellerController.listOtherCateSelected
                                      .addAll(value);
                                }
                              },

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text("Danh mục nghề khác",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 127, 141, 171)))
                                    ],
                                  ),
                                  Obx(
                                    () => _createSellerController
                                                .listOtherCateSelected.length >
                                            0
                                        ? Expanded(
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount:
                                                    _createSellerController
                                                        .listOtherCateSelected
                                                        .length,
                                                reverse: true,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10,
                                                                  left: 10),
                                                          margin:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8.0,
                                                                  horizontal:
                                                                      5.0),
                                                          height: 40,
                                                          child: Center(
                                                            child: Text(
                                                                _createSellerController
                                                                    .listOtherCateSelected[
                                                                        index]
                                                                    .name
                                                                    .toString()),
                                                          ),
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              241, 243, 253),
                                                        ),
                                                        Positioned(
                                                            width: 20,
                                                            height: 20,
                                                            right: 0,
                                                            top: 0,
                                                            child:
                                                                FloatingActionButton(
                                                              child: const Icon(
                                                                Icons.close,
                                                                size: 8,
                                                              ),
                                                              onPressed: () {
                                                                _createSellerController
                                                                    .listOtherCateSelected
                                                                    .removeAt(
                                                                        index);
                                                              },
                                                            )),
                                                      ],
                                                    ),
                                                  );
                                                }))
                                        : Expanded(
                                            child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                chooseCategory.chonDanhmuc
                                                    .toString(),
                                              ),
                                              const Icon(Icons.navigate_next),
                                            ],
                                          )),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Loại hình
                        Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {
                                Get.toNamed(Routes.MY_STORE_TYPEPRODUCT);
                              },

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text("Loại hình",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 127, 141, 171)))
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children:  [
                                      Text(
                                        _createSellerController.typeProSelected.toString(),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Tỉnh/Thành Phố
                        Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {},

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'province_city'.tr,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 127, 141, 171)),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "Hà Nội",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Quận/Huyện
                        Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            height: 50.0,
                            child: InkWell(
                              splashColor:
                                  const Color.fromARGB(255, 188, 195, 216),
                              // splashColor: Colors.blue,
                              onTap: () {},

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'district'.tr,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 127, 141, 171)),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        "Thanh Xuân",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      Icon(Icons.navigate_next),
                                    ],
                                  ))
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 1,
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            color: const Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
//Địa chỉ cửa hàng
                        Container(
                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Text("Địa chỉ cửa hàng",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 127, 141, 171)))
                                ],
                              ),
                              const Expanded(
                                child: TextField(
                                  maxLines: 1,
                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Số nhà/Khu Phố/Phường',
                                    hintStyle: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//Liên kết mạng xã hội
                    Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text("Liên kết mạng xã hội",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${'add'.tr} +",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 85, 170),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//facebook
                    Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Facebook",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "Gắn link",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Icon(Icons.navigate_next),
                                ],
                              ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//zalo
                    Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Zalo",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "Gắn link",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Icon(Icons.navigate_next),
                                ],
                              ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//Youtube
                    Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Youtube",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "Gắn link",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  Icon(Icons.navigate_next),
                                ],
                              ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//Mô tả ngắn
                    Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {
                            Get.to(ShortDescription())?.then((value) {
                              if (value != null) {
                                _createSellerController.seller.description =
                                    value;
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Mô tả ngắn",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(Icons.navigate_next),
                                ],
                              ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
//Chi tiết về về cửa hàng
                    Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: InkWell(
                          splashColor: const Color.fromARGB(255, 188, 195, 216),
                          // splashColor: Colors.blue,
                          onTap: () {},

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Chi tiết về cửa hàng",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 127, 141, 171)),
                                  )
                                ],
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(Icons.navigate_next),
                                ],
                              ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 10,
                      child: Container(
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
// check box đồng ý điều khoản
                    Container(
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                        height: 50.0,
                        child: Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  value: chooseCategory.isAgree.value,
                                  onChanged: (bool? value) {
                                    chooseCategory.isAgree.value =
                                        !chooseCategory.isAgree.value;
                                  }),
                            ),
                            Row(
                              children: [
                                RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(children: [
                                      const TextSpan(
                                        text: 'Tôi đồng ý với các ',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      TextSpan(
                                        text: 'điều khoản',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      const TextSpan(
                                        text: ' của CASYNET',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ]))
                              ],
                            )
                          ],
                        )),
// btn xem trước và Tạo cửa hàng
                    Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      height: 70.0,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5.0),
                                height: 50,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 1.0,
                                        color:
                                            Color.fromARGB(255, 223, 180, 0)),
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    primary:
                                        const Color.fromARGB(255, 223, 180, 0),
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    // Get.to();
                                  },
                                  child: const Text(
                                    'Xem trước',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 223, 180, 0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5.0),
                                height: 50,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 223, 180, 0),
                                    primary: Colors.white,
                                    textStyle: const TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
                                    _createSellerController.formKey.currentState
                                        ?.save();
                                    FocusManager.instance.primaryFocus!
                                        .unfocus();
                                    if (_createSellerController
                                        .formKey.currentState!
                                        .validate()) {
                                      _createSellerController.createSeller();
                                    }
                                  },
                                  child: const Text(
                                    'Tạo cửa hàng',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showActionSheet(BuildContext context, String title) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        // message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              _createSellerController.pickimagecamera();
              Get.back();
            },
            child: Text('take_photo'.tr),
          ),
          CupertinoActionSheetAction(
            onPressed: () {

              _createSellerController.pickimagecamera(isCamera: false);
              Get.back();
            },
            child: Text('gallery_photo'.tr), //thư viện ảnh
          ),
        ],
      ),
    );
  }

  void showActionSheetBackground(BuildContext context, String title) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          title,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        // message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              _createSellerController.pickimagecameraBackground(isCamera: true);
              Get.back();
            },
            child: Text('take_photo'.tr),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              _createSellerController.pickimagecameraBackground(isCamera: false);
              Get.back();
            },
            child: Text('gallery_photo'.tr), //thư viện ảnh
          ),
        ],
      ),
    );
  }

  // _tripEditModalBottomSheet(context, Function(String data) func) {
  //   showModalBottomSheet(
  //       context: context,
  //       backgroundColor: Colors.transparent,
  //       builder: (BuildContext bc) {
  //         return Column(
  //           children: [
  //             Container(
  //               height: MediaQuery.of(context).size.height * .30,
  //               decoration: const BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.all(Radius.circular(10)),
  //               ),
  //               margin:
  //                   const EdgeInsets.only(left: 5.0, bottom: 5.0, right: 5.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Expanded(
  //                       flex: 1,
  //                       // padding: const EdgeInsets.only(top: 15, bottom: 15),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: const [
  //                           Text(
  //                             "Sửa hình đại diện",
  //                             style: TextStyle(
  //                                 color: Color.fromARGB(255, 188, 195, 216),
  //                                 fontSize: 15),
  //                           ),
  //                         ],
  //                       )),
  //                   const Divider(
  //                     height: 2.0,
  //                   ),
  //                   Expanded(
  //                       flex: 1,
  //                       // padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5.0,right: 5.0),
  //                       child: InkWell(
  //                           onTap: () {
  //                             //return path file pick()
  //                             func("value");
  //                           },
  //                           // splashColor: Colors.black26,
  //                           splashColor:
  //                               const Color.fromARGB(255, 188, 195, 216),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Text(
  //                                 'edit'.tr,
  //                                 style: const TextStyle(
  //                                     color: Color.fromARGB(255, 0, 85, 170),
  //                                     fontSize: 15),
  //                               )
  //                             ],
  //                           ))),
  //                   const Divider(
  //                     height: 2.0,
  //                   ),
  //                   Expanded(
  //                       flex: 1,
  //                       // padding: const EdgeInsets.only(top: 15, bottom: 15, left: 5.0,right: 5.0),
  //                       child: InkWell(
  //                           onTap: () {},
  //                           // splashColor: Colors.black26,
  //                           splashColor:
  //                               const Color.fromARGB(255, 188, 195, 216),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: const [
  //                               Text(
  //                                 "Chụp ảnh",
  //                                 style: TextStyle(
  //                                     color: Color.fromARGB(255, 0, 85, 170),
  //                                     fontSize: 15),
  //                               )
  //                             ],
  //                           ))),
  //                   const Divider(
  //                     height: 2.0,
  //                   ),
  //                   Expanded(
  //                       flex: 1,
  //                       // padding: const EdgeInsets.only(top: 15, bottom: 10, left: 5.0,right: 5.0),
  //                       child: InkWell(
  //                           onTap: () {},
  //                           // splashColor: Colors.black26,
  //                           splashColor:
  //                               const Color.fromARGB(255, 188, 195, 216),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: const [
  //                               Text(
  //                                 "Chọn có sẵn",
  //                                 style: TextStyle(
  //                                     color: Color.fromARGB(255, 0, 85, 170),
  //                                     fontSize: 15),
  //                               )
  //                             ],
  //                           ))),
  //                 ],
  //               ),
  //             ),
  //             const Divider(
  //               height: 5.0,
  //             ),
  //             Container(
  //                 decoration: const BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.all(Radius.circular(10)),
  //                 ),
  //                 margin:
  //                     const EdgeInsets.only(left: 5.0, bottom: 5.0, right: 5.0),
  //                 padding: const EdgeInsets.only(
  //                     top: 15, bottom: 15, left: 5.0, right: 5.0),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     InkWell(
  //                         onTap: () {},
  //                         // splashColor: Colors.black26,
  //                         splashColor: const Color.fromARGB(255, 188, 195, 216),
  //                         child: Row(
  //                           // mainAxisAlignment: MainAxisAlignment.center,
  //                           children: const [
  //                             Text(
  //                               "Hủy",
  //                               style: TextStyle(
  //                                   color: Color.fromARGB(255, 0, 85, 170),
  //                                   fontSize: 15),
  //                             )
  //                           ],
  //                         ))
  //                   ],
  //                 )),
  //           ],
  //         );
  //       });
  // }
}
