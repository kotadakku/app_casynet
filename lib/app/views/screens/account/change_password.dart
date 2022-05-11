
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/account/change_password_controller.dart';

import 'widgets/appbar_account_widget.dart';
import '../../theme/app_colors.dart';


class ChangePasswordAccount extends StatelessWidget {
  final ChangePasswordController c = Get.find<ChangePasswordController>();
  ChangePasswordAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarAccountWidget(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h,),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text("Thay đổi mật khẩu",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Divider(
              indent: 10,
            ),
            Padding(padding: EdgeInsets.only(left: 10.w), child: Row(
              children: [
                Expanded(
                    child: Text("Mật khẩu mới",
                      style: TextStyle(
                          color: kTextColor_gray
                      ),
                    )
                ),
                Expanded(
                    child: Obx(()=>
                        TextField(
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
                        )
                    )
                )
              ],
            ),),
            Divider(
              indent: 10,
            ),
            Padding(padding: EdgeInsets.only(left: 10.w), child: Row(
              children: [
                Expanded(
                  child: Text("Xác nhận mật khẩu",
                    style: TextStyle(
                        color: kTextColor_gray
                    ),
                  ),
                ),
                Expanded(
                    child: Obx(() =>
                        TextField(
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
              indent: 10.h,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10.w), child: Row(
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
              indent: 10.h,
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 10.w),
              child: OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    primary: kYellowColor,
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
                padding: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                child: Text("Mã xác minh được gửi vào số điện thoại của bạn",
                  style: TextStyle(
                      color: kTextColor
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                },
                child: Text("Lưu mật khẩu"),
                style: ElevatedButton.styleFrom(
                    primary: kYellowColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
