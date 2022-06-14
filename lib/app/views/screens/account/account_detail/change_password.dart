
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/account/account_detail/change_password_controller.dart';

import '../../../widgets/appbar/appbar_account_widget.dart';
import '../../../theme/app_colors.dart';


class ChangePasswordAccount extends StatelessWidget {
  final ChangePasswordController c = Get.find<ChangePasswordController>();
  ChangePasswordAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarAccountWidget(),
      body: SingleChildScrollView(
        child: Form(
          key: c.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text('change_pass'.tr,
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
                      child: Text('old_pass'.tr,
                        style: TextStyle(
                            color: AppColors.textGrayBoldColor
                        ),
                      )
                  ),
                  Expanded(
                      child: Obx(()=>
                          TextFormField(
                            textAlign: TextAlign.end,
                            obscureText: c.isObscureOldPassword.value,
                            controller: c.oldPassController,
                            validator: (value){

                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  child: c.isObscureOldPassword.value ? Icon(Icons.visibility_off_outlined, color: AppColors.textGrayColor,):
                                  Icon(Icons.visibility_outlined, color: AppColors.yellowColor,),
                                  onTap: (){
                                    c.changeObscureOldPassword(!c.isObscureOldPassword.value);
                                  },
                                ),

                                hintText: 'enter_pass'.tr,
                                hintStyle: TextStyle(
                                    color: AppColors.textGrayColor
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
                      child: Text('new_pass'.tr,
                        style: TextStyle(
                            color: AppColors.textGrayBoldColor
                        ),
                      )
                  ),
                  Expanded(
                      child: Obx(()=>
                          TextFormField(
                            textAlign: TextAlign.end,
                            obscureText: c.isObscurePassword.value,
                            controller: c.newPassController,
                            validator: (value){
                              if (value!.isEmpty) {
                                return "Bạn cần nhập mật khẩu";
                              }if(!RegExp(r'^(?!.* )(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,32}').hasMatch(value)){
                                return "Mật khẩu ít nhất 8 ký tự, trong đó có ít nhất một chữ hoa, số, ký tự đặc biệt, Ex: ngocson_jp@yahoo.co.jp";
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  child: c.isObscurePassword.value ? Icon(Icons.visibility_off_outlined, color: AppColors.textGrayColor,):
                                  Icon(Icons.visibility_outlined, color: AppColors.yellowColor,),
                                  onTap: (){
                                    c.changeObscurePassword(!c.isObscurePassword.value);
                                  },
                                ),

                                hintText: 'enter_pass'.tr,
                                hintStyle: TextStyle(
                                    color: AppColors.textGrayColor
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
                    child: Text('repeat_pass'.tr,
                      style: TextStyle(
                          color: AppColors.textGrayBoldColor
                      ),
                    ),
                  ),
                  Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.end,
                        obscureText: true,
                        controller: c.confirmPassController,
                        validator: (value){
                          if(value != c.newPassController.text){
                            return 'Mật khẩu không trùng khớp';
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.0.w),
                          border: InputBorder.none,
                          hintText: 'repeat_pass'.tr,
                          hintStyle: TextStyle(
                              color: AppColors.textGrayColor
                          ),
                        ),
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
                    child: Text('veri_code'.tr,
                      style: TextStyle(
                          color: AppColors.textGrayBoldColor
                      ),
                    ),
                  ),
                  Expanded(child: TextField(
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'enter_veri_code'.tr,
                        hintStyle: TextStyle(
                            color: AppColors.textGrayColor
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
                      primary: AppColors.yellowColor,
                      side: BorderSide(color: AppColors.yellowColor),
                    ),
                    child: Text('send_code'.tr,
                      style: TextStyle(
                          color: AppColors.yellowColor
                      ),
                    )

                ),
              ),
              Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(right: 10.w, top: 10.h, bottom: 10.h),
                  child: Text('veri_note'.tr,
                    style: TextStyle(
                        color: AppColors.textGrayColor
                    ),
                  )
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    c.changePassword();
                  },
                  child: Text('save_pass'.tr),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.yellowColor
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
