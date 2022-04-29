
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../controller/account/edit_address_controller.dart';
import '../../../widgets/account/appbar_account_widget.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';


class EditAddress extends StatelessWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var address = Get.arguments;
    EditAddressController controller = Get.find<EditAddressController>();
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h), child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sửa địa chỉ mới",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          InkWell(
                            child:  FaIcon(FontAwesomeIcons.solidTrashCan, color: kTextColor, size: sizeIcon.width,),
                            onTap: (){
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
                                initialValue: address.lastname,
                                cursorColor: kTextColor_gray,
                                onSaved: (value)=> controller.address.firstname = value!,
                                textAlign: TextAlign.end,
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
                                initialValue: address.phone,
                                textAlign: TextAlign.end,
                                cursorColor: kTextColor_gray,
                                onSaved: (value)=> controller.address.phone = value!,
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
                                initialValue: address.province,
                                textAlign: TextAlign.end,
                                onSaved: (value)=> controller.address.province = value!,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Hà Nội",
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
                                initialValue: address.district,
                                textAlign: TextAlign.end,
                                onSaved: (value)=> controller.address.district = value!,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Hà Nội",
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
                      Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Row(
                        children: [
                          Expanded(
                              child: Text("Phường/Xã",
                                style: TextStyle(
                                    color: kTextColor_gray
                                ),
                              )
                          ),
                          Expanded(
                              child: TextField(
                                textAlign: TextAlign.end,
                                obscureText: true,
                                cursorColor: kTextColor_gray,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nhập Phường/Xã",
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
                                initialValue: address.street[0],
                                cursorColor: kTextColor_gray,
                                textAlign: TextAlign.end,
                                onSaved: (value)=> controller.address.lastname= value!,
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
                            controller.updateAddress(address.id);
                          },
                          child: Text("Lưu địa chỉ"),
                          style: ElevatedButton.styleFrom(
                              primary: kYellowColor
                          ),
                        ),
                      )
                    ]
                ),
              )
          )
      ),
    );
  }
}
