
import 'package:app_casynet/app/controller/auth/auth_controller.dart';
import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:app_casynet/app/data/model/address.dart';
import 'package:app_casynet/app/data/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/account/new_address_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/appbar/appbar_account_widget.dart';



class NewAddress extends StatelessWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthenticationManager authController = Get.find();
    // AuthController authControllerToken = Get.find();
    NewAddressController controller = Get.find<NewAddressController>();

    Address address = Address();
    User user = User();

    return Material(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBarAccountWidget(),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formStateKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Text('add_address'.tr,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(
                    indent: 10,
                  ),
                  //NHap ho va ten
                  Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                    children: [
                      Expanded(
                          child: Text('enter_name'.tr,
                            style: TextStyle(
                                color: AppColors.textGrayBoldColor
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            cursorColor: AppColors.textGrayBoldColor,
                            textAlign: TextAlign.end,
                            onSaved: (value)
                              {
                                if(value != null){
                                  List<String> val = value.split(" ",);
                                  address.firstname = val[0];
                                  val.removeAt(0);
                                  address.lastname = val.join(" ");
                                };
                              },
                              /*=> controller.address.firstname = value!,*/
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'enter_name'.tr,
                                hintStyle: TextStyle(
                                    color: AppColors.textGrayColor
                                )
                            ),
                          ))
                    ],
                  ),),
                  Divider(
                    indent: 10,
                  ),
                  // Nhap so dien thoai
                  Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                    children: [
                      Expanded(
                          child: Text('phone'.tr,
                            style: TextStyle(
                                color: AppColors.textGrayBoldColor
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.end,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.phone,
                            onSaved: (value) /*=> controller.address.phone = value!*/
                              {
                                address.phone = value;
                              },
                            cursorColor: AppColors.textGrayBoldColor,
                            validator: (value){
                              if (value!.isEmpty) {
                                return "Bạn cần nhập số điện thoại";
                              }
                              if (!RegExp(r"^0[0-9]{9}$").hasMatch(value)) {
                                return "Số điện thoại không chính xác";
                              }
                            },

                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'enter_phone'.tr,
                                hintStyle: TextStyle(
                                    color: AppColors.textGrayColor
                                ),
                            ),
                          ))
                    ],
                  ),),
                  Divider(
                    indent: 10,
                  ),
                  // Nhap thanh pho
                  Padding(padding: EdgeInsets.only(left: 10, ), child: Row(
                    children: [
                      Expanded(
                          child: Text('province_city'.tr,
                            style: TextStyle(
                                color: AppColors.textGrayBoldColor
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            readOnly: true,
                            onTap: (){
                              var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                                "title": "Chọn tỉnh/ thành phố", "regions": controller.provinces
                              });
                              if(data != null){
                                data.then((value){
                                  controller.textProvinceCotroller.text = value['name'];
                                  controller.updateDistrict(value['id']);
                                  controller.textDistrictController.clear();
                                  controller.textCommuneController.clear();
                                });
                              }
                            },
                            controller: controller.textProvinceCotroller,
                            textAlign: TextAlign.end,
                            onSaved: (value)/*=> controller.address.province = value!*/
                              {
                                address.province = value;// tỉnh thành phố
                              },
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "Chọn tỉnh/ thành phố",
                                hintStyle: TextStyle(
                                    color: AppColors.textGrayColor
                                ),
                                suffixIcon: Container(height: 10, width: 10, child: Icon(Icons.arrow_forward_ios, size: 12,),)
                            ),
                          )
                      )
                    ],
                  ),),
                  Divider(
                    indent: 10,
                  ),
                  // Nhap quan huyen
                  Padding(padding: EdgeInsets.only(left: 10, ), child: Row(
            children: [
              Expanded(
                  child: Text('district'.tr,
                    style: TextStyle(
                        color: AppColors.textGrayBoldColor
                    ),
                  )
              ),
              Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: (){
                      var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn Quận/Huyện phố", "regions":  controller.districts
                      });

                      if(data!=null){
                        data.then((value){
                          controller.textDistrictController.text = value['name'];
                          controller.updateCommune(value['id']);
                          controller.textCommuneController.clear();
                        });
                      }
                    },

                    controller: controller.textDistrictController,
                    textAlign: TextAlign.end,
                    onSaved: (value) /*=> controller.address.district = value!*/
                    {
                      address.district = value;
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        hintText: "Chọn quận/ huyện",
                        hintStyle: TextStyle(
                            color: AppColors.textGrayColor
                        ),
                        suffixIcon: Container(height: 10, width: 10, child: Icon(Icons.arrow_forward_ios, size: 12,),)
                    ),
                  )
              )
            ],
          ),),
                  Divider(
                    indent: 10,
                  ),
                  //Chon xa phuong
                  Padding(padding: EdgeInsets.only(left: 10), child: Row(
                    children: [
                      Expanded(
                          child: Text('village'.tr,
                            style: TextStyle(
                                color: AppColors.textGrayBoldColor
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            readOnly: true,
                            onSaved: (value){
                              // address.
                            },
                            onTap: (){
                              var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                                "title": "Chọn xã/ phường", "regions":  controller.communes
                              });
                              if(data!=null){
                                data.then((value){
                                  controller.textCommuneController.text = value['name'];
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
                                hintStyle: TextStyle(
                                    color: AppColors.textGrayColor
                                ),
                                suffixIcon: Container(height: 10, width: 10, child: Icon(Icons.arrow_forward_ios, size: 12,),)
                            ),
                          ))
                    ],
                  ),),
                  Divider(
                    indent: 10,
                  ),
                  // Nhap dia chi cu the
                  Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                    children: [
                      Expanded(
                          child: Text('specific_address'.tr,
                            style: TextStyle(
                                color: AppColors.textGrayBoldColor
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            cursorColor: AppColors.textGrayBoldColor,
                            textAlign: TextAlign.end,
                            onSaved: (value)/*=> controller.address.street[0] = value!*/
                            {
                              address.street.add(value!);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Nhập địa chỉ cụ thể",
                                hintStyle: TextStyle(
                                    color: AppColors.textGrayColor
                                )
                            ),
                          )
                      )
                    ],
                  ),),
                  SizedBox(height: 30,),
                  Divider(
                    indent: 10,
                  ),
                  //Swich
                  Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('set_default_address'.tr,
                          style: TextStyle(
                              color: AppColors.textGrayBoldColor
                          )
                      ),
                      Obx(()=>Switch(value: controller.switch_default.value, onChanged: (value) {
                        address.default_shipping = value;
                      }))
                    ],
                  ),
                  ),
                  Container(height: 10, color: AppColors.backgroundColor,),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // controller.address.default_shipping = controller.switch_default.value;
                        // controller.formStateKey.currentState?.save();
                        // controller.postAddress();
                        address.email = authController.user_current.email;
                        controller.formStateKey.currentState?.save();

                        controller.createAddress(address);
                        print(address.toJsonAddress());
                      },
                      child: Text('save_address'.tr),
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.yellowColor
                      ),

                    ),
                  )
                ]
            ),
          ),
        )
      ),
    );
  }
}

