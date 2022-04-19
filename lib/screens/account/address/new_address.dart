
import 'package:app_casynet/screens/account/address/select_region.dart';
import 'package:app_casynet/widget/account/appbar_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/account/new_address_controller.dart';
import '../../../theme/app_colors.dart';


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
                  SizedBox(height: 30,),
                  Text("Thêm địa chỉ mới",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
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
                            onSaved: (value)=> controller.address.name = value!,
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
                            onSaved: (value) => controller.address.phone = value!,
                            cursorColor: kTextColor_gray,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Nhập số điện thoại",
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
                  // Nhap thanh pho
                 GestureDetector(
                   behavior: HitTestBehavior.translucent,
                   onTap: (){
                     var data = Get.to(SelectRegionPage(title: "Chọn tỉnh/ thành phố", regions: controller.provinces));
                     if(data != null){
                       data.then((value){
                         controller.textProvinceCotroller.text = value['name'];
                         controller.updateDistrict(value['id']);
                         controller.textDistrictController.clear();
                         controller.textCommuneController.clear();
                       });
                     }
                   },
                   child:  Padding(padding: EdgeInsets.only(left: 10, ), child: Row(
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
                             controller: controller.textProvinceCotroller,
                             textAlign: TextAlign.end,
                             onSaved: (value)=> controller.address.province = value!,
                             decoration: InputDecoration(
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
                 ),
                  Divider(
                    indent: 10,
                  ),
                  // Nhap quan huyen
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      var data = Get.to(SelectRegionPage(title: "Chọn quận/ huyện", regions: controller.districts));
                      if(data!=null){
                        data.then((value){
                          controller.textDistrictController.text = value['name'];
                          controller.updateCommune(value['id']);
                          controller.textCommuneController.clear();
                        });
                      }
                    },
                    child: Padding(padding: EdgeInsets.only(left: 10, ), child: Row(
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
                              controller: controller.textDistrictController,
                              textAlign: TextAlign.end,
                              onSaved: (value) => controller.address.district = value!,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
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
                  ),
                  Divider(
                    indent: 10,
                  ),
                  //Chon xa phuong
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: (){
                      var data = Get.to(SelectRegionPage(title: "Chọn xã/ phường", regions: controller.communes));
                      if(data!=null){
                        data.then((value){
                          controller.textCommuneController.text = value['name'];
                        });
                      }
                    },
                    child: Padding(padding: EdgeInsets.only(left: 10), child: Row(
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
                              textAlign: TextAlign.end,
                              controller: controller.textCommuneController,
                              cursorColor: kTextColor_gray,
                              decoration: InputDecoration(
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
                  ),
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
                            onSaved: (value)=> controller.address.detail_address = value!,
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
                        controller.address.default_address = controller.switch_default.value;
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

