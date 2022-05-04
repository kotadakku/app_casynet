
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../controller/account/new_address_controller.dart';
import '../../../../routes/app_pages.dart';
import '../widgets/appbar_account_widget.dart';
import '../../../theme/app_colors.dart';
import 'select_region.dart';



class NewAddress extends StatelessWidget {
  const NewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    NewAddressController controller = Get.find<NewAddressController>();
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
                    child: Text("Thêm địa chỉ mới",
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
                          child: Text("Nhập họ và tên",
                            style: TextStyle(
                                color: kTextColor_gray
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            cursorColor: kTextColor_gray,
                            textAlign: TextAlign.end,
                            onSaved: (value)=> controller.address.firstname = value!,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Nhập họ và tên",
                                hintStyle: TextStyle(
                                    color: kTextColor
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
                          child: Text("Số điện thoại",
                            style: TextStyle(
                                color: kTextColor_gray
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.end,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.phone,
                            onSaved: (value) => controller.address.phone = value!,
                            cursorColor: kTextColor_gray,
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
                                hintText: "Nhập số điện thoại",
                                hintStyle: TextStyle(
                                    color: kTextColor
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
                          child: Text("Tỉnh/Thành phố",
                            style: TextStyle(
                                color: kTextColor_gray
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
                            onSaved: (value)=> controller.address.province = value!,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "Chọn tỉnh/ thành phố",
                                hintStyle: TextStyle(
                                    color: kTextColor
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
                  child: Text("Quận/Huyện",
                    style: TextStyle(
                        color: kTextColor_gray
                    ),
                  )
              ),
              Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: (){
                      var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                        "title": "Chọn tỉnh/ thành phố", "regions":  controller.districts
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
                    onSaved: (value) => controller.address.district = value!,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                        hintText: "Chọn quận/ huyện",
                        hintStyle: TextStyle(
                            color: kTextColor
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
                          child: Text("Phường/Xã",
                            style: TextStyle(
                                color: kTextColor_gray
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            readOnly: true,
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
                            cursorColor: kTextColor_gray,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                                border: InputBorder.none,
                                hintText: "Chọn Phường/Xã",
                                hintStyle: TextStyle(
                                    color: kTextColor
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
                          child: Text("Địa chỉ cụ thể",
                            style: TextStyle(
                                color: kTextColor_gray
                            ),
                          )
                      ),
                      Expanded(
                          child: TextFormField(
                            cursorColor: kTextColor_gray,
                            textAlign: TextAlign.end,
                            onSaved: (value)=> controller.address.street[0] = value!,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Nhập địa chỉ cụ thể",
                                hintStyle: TextStyle(
                                    color: kTextColor
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
                      Text("Đặt làm địa chỉ mặc định",
                          style: TextStyle(
                              color: kTextColor_gray
                          )
                      ),
                      Obx(()=>Switch(value: controller.switch_default.value, onChanged: (value) {
                        controller.switch_default.value = value;
                      }))
                    ],
                  ),
                  ),
                  Container(height: 10, color: kBackgroundColor,),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.address.default_shipping = controller.switch_default.value;
                        controller.formStateKey.currentState?.save();
                        controller.postAddress();
                      },
                      child: Text("Lưu địa chỉ"),
                      style: ElevatedButton.styleFrom(
                          primary: kYellowColor
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

