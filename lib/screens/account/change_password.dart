import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/widget/account/top_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/account/change_password_controller.dart';

class ChangePasswordAccount extends StatelessWidget {
  final ChangePasswordController c = Get.put(ChangePasswordController());
  ChangePasswordAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopAccountWidget(),
              SizedBox(height: 30,),
              Text("Thay đổi mật khẩu",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              Divider(
                indent: 10,
              ),
              Padding(padding: EdgeInsets.only(left: 10), child: Row(
                children: [
                  Expanded(
                      child: Text("Mật khẩu mới",
                        style: TextStyle(
                            color: kTextColor_gray
                        ),
                      )
                  ),
                  Expanded(
                    child: Obx(()=> TextField(
                      textAlign: TextAlign.end,
                      obscureText: c.isObscurePassword.value,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          child: c.isObscurePassword.value ? Icon(Icons.visibility_off_outlined, color: kTextColor,):
                          Icon(Icons.visibility_outlined, color: kYellowColor,),
                          onTap: (){
                            c.changeObscurePassword(!c.isObscurePassword.value);
                          },
                        ),
                        hintText: "Nhập mật khẩu",
                        hintStyle: TextStyle(
                          color: kTextColor
                        )
                      ),
                    ))
                  )
                ],
              ),),
              Divider(
                indent: 10,
              ),
              Padding(padding: EdgeInsets.only(left: 10), child: Row(
                children: [
                  Expanded(
                    child: Text("Xác nhận mật khẩu",
                      style: TextStyle(
                        color: kTextColor_gray
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(() => TextField(
                      textAlign: TextAlign.end,
                      obscureText: c.isObscureConfirmPassword.value,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          child: c.isObscureConfirmPassword.value ? Icon(Icons.visibility_off_outlined, color: kTextColor,):
                        Icon(Icons.visibility_outlined, color: kYellowColor,), onTap: (){
                          c.changeObscureConfirmPassword(!c.isObscureConfirmPassword.value);
                        },),
                        hintText: "Xác nhận mật khẩu",
                        hintStyle: TextStyle(
                          color: kTextColor
                        ),
                      ),

                    )
                    )
                  )
                ],
              ),),
              Divider(
                indent: 10,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Row(
                children: [
                  Expanded(
                    child: Text("Mã xác minh",
                      style: TextStyle(
                          color: kTextColor_gray
                      ),
                    ),
                  ),
                  Expanded(child: TextField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Nhập mã xác minh",
                      hintStyle: TextStyle(
                        color: kTextColor
                      )
                    ),

                  ))
                ],
              )),
              Divider(
                indent: 10,
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 10),
                child: OutlinedButton(
                    onPressed: (){},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: kYellowColor),
                    ),
                    child: Text("Gửi mã xác minh",
                      style: TextStyle(
                          color: kYellowColor
                      ),
                    )

                ),
              ),
              Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 10, top: 10, bottom: 10),
                  child: Text("Mã xác minh được gửi vào số điện thoại của bạn",
                    style: TextStyle(
                      color: kTextColor
                    ),
                  )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {  },
                  child: Text("Lưu mật khẩu"),
                  style: ElevatedButton.styleFrom(
                    primary: kYellowColor
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
