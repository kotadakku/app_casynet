
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/account/edit_address_controller.dart';
import '../../../theme/app_colors.dart';
import '../widgets/appbar_account_widget.dart';



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
                                    color: AppColors.textGrayBoldColor
                                ),
                              )
                          ),
                          Expanded(
                              child: TextFormField(
                                initialValue: address.lastname,
                                cursorColor: AppColors.textGrayBoldColor,
                                onSaved: (value)=> controller.address.firstname = value!,
                                textAlign: TextAlign.end,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nhập họ và tên",
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
                      Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                        children: [
                          Expanded(
                              child: Text("Số điện thoại",
                                style: TextStyle(
                                    color: AppColors.textGrayBoldColor
                                ),
                              )
                          ),
                          Expanded(
                              child: TextFormField(
                                // keyboardType: TextInputType.phone,
                                initialValue: address.phone,
                                textAlign: TextAlign.end,
                                cursorColor: AppColors.textGrayBoldColor,

                                onSaved: (value)=> controller.address.phone = value!,
                                onChanged: (value){
                                  String test = value;
                                  print(test);
                                },
                                validator: (value){
                                  if (!RegExp(r"^0[0-9]{9}$").hasMatch(value!)) {
                                    return "Bạn nhập số điện thoại chưa đúng định dạng";
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nhập số điện thoại",
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
                      Padding(padding: EdgeInsets.only(left: 10, ), child: Row(
                        children: [
                          Expanded(
                              child: Text("Tỉnh/Thành phố",
                                style: TextStyle(
                                    color: AppColors.textGrayBoldColor
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
                      Padding(padding: EdgeInsets.only(left: 10, ), child: Row(
                        children: [
                          Expanded(
                              child: Text("Quận/Huyện",
                                style: TextStyle(
                                    color: AppColors.textGrayBoldColor
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
                      Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Row(
                        children: [
                          Expanded(
                              child: Text("Phường/Xã",
                                style: TextStyle(
                                    color: AppColors.textGrayBoldColor
                                ),
                              )
                          ),
                          Expanded(
                              child: TextField(
                                textAlign: TextAlign.end,
                                obscureText: true,
                                cursorColor: AppColors.textGrayBoldColor,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nhập Phường/Xã",
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
                      Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                        children: [
                          Expanded(
                              child: Text("Địa chỉ cụ thể",
                                style: TextStyle(
                                    color: AppColors.textGrayBoldColor
                                ),
                              )
                          ),
                          Expanded(
                              child: TextFormField(
                                initialValue: address.street[0],
                                cursorColor: AppColors.textGrayBoldColor,
                                textAlign: TextAlign.end,
                                onSaved: (value)=> controller.address.lastname= value!,
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
                      Padding(padding: EdgeInsets.only(left: 10, right: 10 ), child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Đặt làm địa chỉ mặc định",
                              style: TextStyle(
                                  color: AppColors.textGrayBoldColor
                              )
                          ),
                          Obx(()=>Switch(value: controller.switch_default.value, onChanged: (value) {
                            controller.switch_default.value = value;
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
                            controller.address.default_shipping = controller.switch_default.value;
                            controller.formStateKey.currentState?.save();
                            controller.updateAddress(address.id);
                          },
                          child: Text("Lưu địa chỉ"),
                          style: ElevatedButton.styleFrom(
                              primary: AppColors.yellowColor
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
