import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/controller/account/auth/auth_controller.dart';
import 'package:app_casynet/app/controller/account/auth/authentication_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_casynet/app/data/data.dart';

import '../../../routes/app_pages.dart';

class ChangePasswordController extends GetxController{
  final isObscureOldPassword = true.obs;
  var isObscurePassword = true.obs;

  final TextEditingController oldPassController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  changeObscurePassword(value) => isObscurePassword.value = value;
  changeObscureOldPassword(value) => isObscureOldPassword.value = value;

  void changePassword() async {
    AuthenticationManager authenticationManager = Get.find();
    if(formKey.currentState!.validate()){
      final token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
      try{
        final result = await UserRepo().changePassword(
            current_password: oldPassController.text,
            new_password: newPassController.text,
            options: Options(
                headers: {
                  'Authorization': 'Bearer ${token}'
                }
            )
        );
        if(result.statusCode == CODE_SUCCESS){
          authenticationManager.logOut();
          Get.defaultDialog(
            title: 'noti'.tr,
            middleText: 'Đổi mật khẩu thành công',
            textConfirm: 'signin_again',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            },
          );
          Get.offAndToNamed(Routes.AUTH, arguments: 0);
        }
        else{
          Get.defaultDialog(
            title: 'noti'.tr,
            middleText: result.msg.toString(),
            textConfirm: 'confirm'.tr,
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            },
          );
        }
      }catch(error){
        Get.defaultDialog(
          title: 'noti'.tr,
          middleText: 'Hệ thống đang bị lỗi!',
          textConfirm: 'confirm'.tr,
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          },

        );
      }
    }
  }
}