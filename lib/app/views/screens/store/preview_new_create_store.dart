import 'dart:io';

import 'package:app_casynet/app/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';

class PreviewNewCreatedStore extends StatelessWidget {
  PreviewNewCreatedStore({Key? key}) : super(key: key);

  final CreateSellerController _previewCreateSellerCtr = Get.find();
  final OtherCategoryController _previewOtherCateCtr = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('preview'.tr),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150.0.h,
                          child: Obx(() => _previewCreateSellerCtr
                                      .imgBackground_selected.value ==
                                  ""
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150.0.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [Colors.grey, Colors.white],
                                    ),
                                  ),
                                )
                              : Image.file(
                                  File(_previewCreateSellerCtr
                                      .imgBackground_selected.value),
                                  fit: BoxFit.fitWidth,
                                )),
                        ),
                        Container(
                          width: 100.0.w,
                          height: 100.0.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(File(_previewCreateSellerCtr
                                      .image_selected.value)),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

              Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Expanded(
                      child: Text("Tên cửa hàng",
                          style: TextStyle(
                              color: Color.fromARGB(255, 127, 141, 171))),
                    ),
                    Expanded(
                      child:
                          Text(_previewCreateSellerCtr.seller.name.toString()),
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

              Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                        child: Text("Đường link cửa hàng",
                            style: TextStyle(
                                color: Color.fromARGB(255, 127, 141, 171)))),
                    Expanded(
                      child: Text(
                          _previewCreateSellerCtr.seller.linkSeller.toString()),
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

              Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text('phone'.tr,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 127, 141, 171)))),
                    Expanded(
                      child:
                          Text(_previewCreateSellerCtr.seller.phone.toString()),
                    ),
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

//Giờ mở cửa
              Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('time_open'.tr,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 127, 141, 171)))
                      ],
                    )),
                    Expanded(
                        child: Text(
                            _previewCreateSellerCtr.open_time.value.toString()))
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

              Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('time_close'.tr,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 127, 141, 171)))
                      ],
                    )),
                    Expanded(
                        child: Text(_previewCreateSellerCtr.close_time.value
                            .toString()))
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

              Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('main_category'.tr,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 127, 141, 171)))
                      ],
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _previewOtherCateCtr.chooseMainCategory.toString(),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

              //Danh mục nghề khác
              Container(
                  margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("Danh mục nghề khác",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 127, 141, 171)))
                        ],
                      ),
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: _previewCreateSellerCtr
                              .listOtherCateSelected.length,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Container(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 10),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 5.0),
                                    height: 40,
                                    child: Center(
                                      child: Text(_previewCreateSellerCtr
                                          .listOtherCateSelected[index].name
                                          .toString()),
                                    ),
                                    color: const Color.fromARGB(
                                        255, 241, 243, 253),
                                  ),
                                  // Positioned(
                                  //     width: 20,
                                  //     height: 20,
                                  //     right: 0,
                                  //     top: 0,
                                  //     child:
                                  //     FloatingActionButton(
                                  //       child: const Icon(
                                  //         Icons.close,
                                  //         size: 8,
                                  //       ),
                                  //       onPressed: () {
                                  //         _previewCreateSellerCtr
                                  //             .listOtherCateSelected
                                  //             .removeAt(
                                  //             index);
                                  //       },
                                  //     )),
                                ],
                              ),
                            );
                          })
                    ],
                  )),
              const Divider(
                indent: 10,
              ),

              //Loại hình
              Container(
                  margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("Loại hình",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 127, 141, 171)))
                        ],
                      ),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Obx(
                            () => Text(
                              _previewCreateSellerCtr.typeProSelected.value
                                  .toString(),
                              style: TextStyle(fontSize: 17.0.sp),
                            ),
                          ),
                        ],
                      ))
                    ],
                  )),
              const Divider(
                indent: 10,
              ),

              // Tỉnh/Thành Phố
              Container(
                height: 50.0.h,
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      'province_city'.tr,
                      style:
                          const TextStyle(color: AppColors.textGrayBoldColor),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [Text("abcdefg")],
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

              //Quận/Huyện
              Container(
                height: 50.0.h,
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      'district'.tr,
                      style:
                          const TextStyle(color: AppColors.textGrayBoldColor),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text("abcdefg")],
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),

              //Địa chỉ cửa hàng
              Container(
                height: 50.0.h,
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Địa chỉ cửa hàng'.tr,
                      style:
                          const TextStyle(color: AppColors.textGrayBoldColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("data"),
                        /*_previewCreateSellerCtr.address!.street[0].toString()*/
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),
              Container(
                height: 50.0.h,
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Facebook'.tr,
                      style:
                          const TextStyle(color: AppColors.textGrayBoldColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_previewCreateSellerCtr.seller.linkFacebook
                            .toString()),
                        /*_previewCreateSellerCtr.address!.street[0].toString()*/
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),
              Container(
                height: 50.0.h,
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Zalo'.tr,
                      style:
                          const TextStyle(color: AppColors.textGrayBoldColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            _previewCreateSellerCtr.seller.linkZalo.toString()),
                        /*_previewCreateSellerCtr.address!.street[0].toString()*/
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),
              Container(
                height: 50.0.h,
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Youtube'.tr,
                      style: const TextStyle(color: AppColors.textGrayBoldColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_previewCreateSellerCtr.seller.linkYoutube
                            .toString()),
                        /*_previewCreateSellerCtr.address!.street[0].toString()*/
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                indent: 10,
              ),
              Container(
                height: 50.0.h,
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Mô tả ngắn", style: const TextStyle(color: AppColors.textGrayBoldColor),
                    ),

                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Text(_previewCreateSellerCtr.seller.description.toString()),
              ),
              const Divider(
                indent: 10,
              ),
              Container(
                height: 50.0.h,
                margin: EdgeInsets.only(left: 10.0.w,right: 10.0.w),
                child: Row(
                  children: [
                    Text("Chi tiết về cửa hàng",
                      style: const TextStyle(color: AppColors.textGrayBoldColor),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                child: Text(_previewCreateSellerCtr.seller.detailSeller.toString()),
              ),
              const Divider(
                indent: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
