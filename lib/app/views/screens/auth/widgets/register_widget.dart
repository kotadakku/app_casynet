
import 'package:app_casynet/app/views/widgets/loading_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../controller/account/auth/auth_controller.dart';
import '../../../../data/model/user.dart';

import '../../../theme/app_colors.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var _isMale = true.obs;
    var _isCheckboxAccept = true.obs;
    AuthController authController = Get.find();
    User user = User();
    return  Obx(()=>LoadingOverlay(
        isLoading: authController.register_loading.value,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: authController.formRegisterKey,
            child: ListView(
              children: [
                Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  //TextField Họ và tên
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: AppColors.yellowColor,
                      onSaved: (value) {
                        if(value != null){
                          List<String> val = value.split(" ",);
                          user.firstname = val[0];
                          val.removeAt(0);
                          user.lastname = val.join(" ");
                        };

                      },
                      validator: (value) {
                        if (value == null) {
                          return "Bạn cần nhập họ và tên, không được để trống 1";
                        }
                        if (value.isEmpty) {
                          return "bạn cần nhập họ và tên, không được để trống";
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintStyle: const TextStyle(fontSize: 12),
                        hintText: 'name'.tr,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Icon(
                            Icons.perm_identity,
                            color: AppColors.textGrayColor,
                          ),
                        ),
                        suffixIcon: SizedBox(
                          height: 15,
                          width: 15,
                          child: Center(
                              child:
                              Text("*", style: TextStyle(color: Colors.red))),
                        ),
                      )),

                  SizedBox(
                    height: 10,
                  ),
                  //TextField Email
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: authController.focusNodeEmail,
                      onSaved: (value) {
                        user.email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {

                          return "Bạn chưa nhập đúng định dạng, Ex: a@gmail.com";
                        }
                      },
                      cursorColor: AppColors.yellowColor,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 12),
                          hintText: 'Email',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.email_outlined,
                              color: AppColors.textGrayColor,
                            ),
                          ),
                          suffixIcon: SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                                child:
                                Text("*", style: TextStyle(color: Colors.red))),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  //TextField Số điện thoại
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: authController.focusNodePhone,
                      onSaved: (value) {
                        user.phone = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Bạn cần nhập số điện thoại";
                        }
                        if (!RegExp(r"^0[0-9]{9}$").hasMatch(value)) {
                          return "Số điện thoại không hợp lệ";
                        }
                      },
                      keyboardType: TextInputType.phone,
                      cursorColor: AppColors.yellowColor,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 12),
                          hintText: 'phone'.tr,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.phone,
                              color: AppColors.textGrayColor,
                            ),
                          ),
                          suffixIcon: SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                                child:
                                Text("*", style: TextStyle(color: Colors.red))),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField mật khẩu
                  Obx(()=>TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authController.passwordController,
                      textAlignVertical: TextAlignVertical.center,
                      onSaved: (value) {
                        user.password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Bạn cần nhập mật khẩu";
                        }if(!RegExp(r'^(?!.* )(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,32}').hasMatch(value)){
                          return "Mật khẩu ít nhất 8 ký tự, trong đó có ít nhất một chữ hoa, số, ký tự đặc biệt, Ex: ngocson_jp@yahoo.co.jp";
                        }
                        //(?=.*?[!@#\><*~])
                      },
                      obscureText: authController.isRegisterObscurePassword.value,
                      cursorColor: AppColors.yellowColor,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 12),
                          hintText: 'password'.tr,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.lock,
                              color: AppColors.textGrayColor,
                            ),
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                child: authController.isRegisterObscurePassword.value ? Icon(Icons.visibility_off_outlined, color: AppColors.textGrayColor,):
                                Icon(Icons.visibility_outlined, color: AppColors.yellowColor,), onTap: (){
                                authController.changeRegisterObscurePassword(!authController.isRegisterObscurePassword.value);
                              },),
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: Center(
                                    child:
                                    Text("*", style: TextStyle(color: Colors.red))),
                              )
                            ],
                          )
                      )
                  ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //TextField xác nhận mật khẩu
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlignVertical: TextAlignVertical.center,
                      obscureText: true,
                      cursorColor: AppColors.yellowColor,
                      onSaved: (value) {},
                      validator: (value) {
                        /*if (value.length < ) {
                      return "Bạn cần nhập nhiều hơn 8 ký tự";

                    }*/if (value!.isEmpty) {
                          return "Bạn cần nhập mật khẩu";
                        }
                        if(value != authController.passwordController.text){
                          return "Mật khẩu không trùng khớp";
                        }
                      },
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintStyle: const TextStyle(fontSize: 12),
                          hintText: 'repeat_pass'.tr,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.lock,
                              color: AppColors.textGrayColor,
                            ),
                          ),
                          suffixIcon: SizedBox(
                            height: 15,
                            width: 15,
                            child: Center(
                                child:
                                Text("*", style: TextStyle(color: Colors.red))),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  // TextField 'birthday'.tr
                  TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: AppColors.yellowColor,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authController.birthDayTextController,
                      onSaved: (value) {
                        user.birthday = value;
                      },
                      validator: (value){
                        
                      },
                      readOnly: true,
                      onTap: (){
                        authController.showDateBirthdayPicker(context);
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: AppColors.yellowColor, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: BorderSide(color: AppColors.textGrayColor, width: 2.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintStyle: const TextStyle(fontSize: 12),
                        hintText: 'birthday'.tr,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: IconButton(
                              color: AppColors.textGrayColor,
                              onPressed: () {
                              },
                              icon: Icon(
                                Icons.calendar_today_rounded,
                              )),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  // CHọn giới tính
                  Row(
                    children: [
                      Text('sex'.tr),
                      Obx(() => Radio(
                          value: true,
                          groupValue: _isMale.value,
                          onChanged: (value) {
                            _isMale.value = !_isMale.value;
                          },
                          activeColor: Color(0xffDFB400))),
                      Text('male'.tr),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(() => Radio(
                          value: false,
                          groupValue: _isMale.value,
                          onChanged: (value) {
                            _isMale.value = !_isMale.value;
                          },
                          activeColor: Color(0xffDFB400))),
                      Text('female'.tr)
                    ],
                  ),
                  // Checkbox xác nhận nhận thông tin
                  Row(
                    children: [
                      Obx(
                            () => Checkbox(
                            activeColor: AppColors.yellowColor,
                            value: _isCheckboxAccept.value,
                            onChanged: (value) {
                              _isCheckboxAccept.value = !_isCheckboxAccept.value;
                            }),
                      ),
                      SizedBox(width: 5.0),
                      SizedBox(
                          width: 250,
                          child: Text(
                            'accept_noti'.tr,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  // Button tạo tài khoản
                  ElevatedButton(
                    onPressed: () async {
                      user.gender = _isMale.value? 1:0;
                      user.receiveNotification = _isCheckboxAccept.value;

                      authController.formRegisterKey.currentState?.save();
                      FocusManager.instance.primaryFocus!.unfocus();
                      if(authController.formRegisterKey.currentState!.validate()){
                        await authController.registerUser(user);
                      }
                      else {
                        Get.defaultDialog(
                            middleText: 'Vui lòng nhập đầy đủ thông tin',
                            title:  'noti'.tr,
                            textConfirm: 'OK',
                            confirmTextColor: Colors.white,
                            onConfirm: () {
                              Get.back();
                            }
                        );
                      }


                    },
                    style: ElevatedButton.styleFrom(
                        primary: AppColors.yellowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.assignment_ind_outlined),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'create_account'.tr,
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                          'notify_span1'.tr,
                          style: new TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'notify_span2'.tr,
                          style: new TextStyle(color: Colors.blue),
                          recognizer: new TapGestureRecognizer()..onTap = () {},
                        ),
                        // TextSpan(
                        //   text: 'của Casynet',
                        //   style: new TextStyle(color: Colors.black),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,)
                ]),
              ],
            ),
          ),
        )
      )
    );
  }
}
