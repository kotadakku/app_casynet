import 'package:app_casynet/app/controller/home/api/region_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/account/edit_address_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/appbar/appbar_account_widget.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var address = Get.arguments;
    EditAddressController controller = Get.find<EditAddressController>();
    RegionController _regionController = Get.find();
    return Material(
      color: Colors.white,
      child: Scaffold(
          appBar: AppBarAccountWidget(),
          body: SingleChildScrollView(
              child: Form(
            key: controller.formStateKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sửa địa chỉ mới",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        print("Delete");
                        controller.deleteAddress(address.id);
                      },
                    )
                  ],
                ),
              ),
              Divider(
                indent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'enter_name'.tr,
                      style: TextStyle(color: AppColors.textGrayBoldColor),
                    )),
                    Expanded(
                        child: TextFormField(
                      initialValue: address.lastname,
                      cursorColor: AppColors.textGrayBoldColor,
                      onSaved: (value) => controller.address.firstname = value!,
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'enter_name'.tr,
                          hintStyle: TextStyle(color: AppColors.textGrayColor)),
                    ))
                  ],
                ),
              ),
              Divider(
                indent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'phone'.tr,
                      style: TextStyle(color: AppColors.textGrayBoldColor),
                    )),
                    Expanded(
                        child: TextFormField(
                      // keyboardType: TextInputType.phone,
                      initialValue: address.phone,
                      textAlign: TextAlign.end,
                      cursorColor: AppColors.textGrayBoldColor,

                      onSaved: (value) => controller.address.phone = value!,
                      onChanged: (value) {
                        String test = value;
                        print(test);
                      },
                      validator: (value) {
                        if (!RegExp(r"^0[0-9]{9}$").hasMatch(value!)) {
                          return "Bạn nhập số điện thoại chưa đúng định dạng";
                        }
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'enter_phone'.tr,
                          hintStyle: TextStyle(color: AppColors.textGrayColor)),
                    ))
                  ],
                ),
              ),
              Divider(
                indent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'province_city'.tr,
                      style: TextStyle(color: AppColors.textGrayBoldColor),
                    )),
                    Expanded(
                        child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        var data = Get.toNamed(Routes.SELECT_REGION,
                            arguments: {
                              "title": "Chọn tỉnh/ thành phố",
                              "regions": _regionController.provinces
                            });
                        if (data != null) {
                          data.then((value) {
                            controller.textProvinceCotroller.text = value.name;
                            _regionController.getDistrictsApi(value.id);
                            controller.textDistrictController.clear();
                            controller.textCommuneController.clear();
                          });
                        }
                      },
                      controller: controller.textProvinceCotroller,
                      textAlign: TextAlign.end,
                      onSaved:
                          (value) /*=> controller.address.province = value!*/ {
                        address.province = value; // tỉnh thành phố
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          border: InputBorder.none,
                          hintText: "Chọn tỉnh/ thành phố",
                          hintStyle: TextStyle(color: AppColors.textGrayColor),
                          suffixIcon: Container(
                            height: 10,
                            width: 10,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          )),
                    ))
                  ],
                ),
              ),
              Divider(
                indent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'district'.tr,
                      style: TextStyle(color: AppColors.textGrayBoldColor),
                    )),
                    Expanded(
                        child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        var data = Get.toNamed(Routes.SELECT_REGION,
                            arguments: {
                              "title": "Chọn Quận/Huyện phố",
                              "regions": _regionController.districts
                            });

                        if (data != null) {
                          data.then((value) {
                            controller.textDistrictController.text = value.name;
                            _regionController.getVillagesApi(value.id);
                            controller.textCommuneController.clear();
                          });
                        }
                      },
                      controller: controller.textDistrictController,
                      textAlign: TextAlign.end,
                      onSaved:
                          (value) /*=> controller.address.district = value!*/ {
                        address.district = value;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          hintText: "Chọn quận/ huyện",
                          hintStyle: TextStyle(color: AppColors.textGrayColor),
                          suffixIcon: Container(
                            height: 10,
                            width: 10,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          )),
                    ))
                  ],
                ),
              ),
              Divider(
                indent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'village'.tr,
                      style: TextStyle(color: AppColors.textGrayBoldColor),
                    )),
                    Expanded(
                        child: TextFormField(
                      readOnly: true,
                      onSaved: (value) {
                        // address.
                      },
                      onTap: () {
                        var data = Get.toNamed(Routes.SELECT_REGION,
                            arguments: {
                              "title": "Chọn xã/ phường",
                              "regions": _regionController.communes
                            });
                        if (data != null) {
                          data.then((value) {
                            controller.textCommuneController.text = value.name;
                          });
                        }
                      },
                      textAlign: TextAlign.end,
                      controller: controller.textCommuneController,
                      cursorColor: AppColors.textGrayBoldColor,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          border: InputBorder.none,
                          hintText: "Chọn Phường/Xã",
                          hintStyle: TextStyle(color: AppColors.textGrayColor),
                          suffixIcon: Container(
                            height: 10,
                            width: 10,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                            ),
                          )),
                    ))
                  ],
                ),
              ),
              Divider(
                indent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      'specific_address'.tr,
                      style: TextStyle(color: AppColors.textGrayBoldColor),
                    )),
                    Expanded(
                        child: TextFormField(
                      initialValue: address.street[0],
                      cursorColor: AppColors.textGrayBoldColor,
                      textAlign: TextAlign.end,
                      onSaved: (value) => controller.address.lastname = value!,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nhập địa chỉ cụ thể",
                          hintStyle: TextStyle(color: AppColors.textGrayColor)),
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                indent: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('set_default_address'.tr,
                        style: TextStyle(color: AppColors.textGrayBoldColor)),
                    Obx(() => Switch(
                        value: controller.switch_default.value,
                        onChanged: (value) {
                          controller.switch_default.value = value;
                        }))
                  ],
                ),
              ),
              Container(
                height: 10,
                color: AppColors.backgroundColor,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.address.default_shipping =
                        controller.switch_default.value;
                    controller.formStateKey.currentState?.save();
                    controller.updateAddress(address.id);
                  },
                  child: Text('save_address'.tr),
                  style:
                      ElevatedButton.styleFrom(primary: AppColors.yellowColor),
                ),
              )
            ]),
          ))),
    );
  }
}
