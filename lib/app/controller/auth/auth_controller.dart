import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/user.dart';

class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
  late final AuthenticationManager _authManager;
  late TabController controller;
  var sigin_loading = false.obs;
  var register_loading = false.obs;

  var isObscurePassword = true.obs;
  var isRegisterObscurePassword = true.obs;
  var isRegisterObscureConfirmPassword = true.obs;
  final ScaffoldMessengerState scaffoldMessenger = Get.find<ScaffoldMessengerState>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> formSignInKey = GlobalKey<FormState>();
  GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController, birthDayTextController;

  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find();
    int index = Get.arguments;
    controller = TabController(length:2, vsync: this, initialIndex: index);
    emailController = TextEditingController();
    passwordController = TextEditingController();
    birthDayTextController = TextEditingController();
  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    birthDayTextController.dispose();
  }

  String?  validateEmail(String value){
    if(!GetUtils.isEmail(value)){
      return "Provide valid Email";
    }
  }
  void checkLogin(){
    final isValid = loginFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    loginFormKey.currentState!.save();
  }

  Future<void> loginUser(User user) async {
      sigin_loading.value = true;
      try{
        final result = await HomePageRepo().getTokenUser(
          user.toJsonLogin(),
        );
        if(result != null){
          if(result.isSuccess){
            await _authManager.login(result.objects , user);
            sigin_loading.value = false;
            Get.back();
            scaffoldMessenger.showSnackBar(
              const SnackBar(content: Text('Đăng nhập thành công'), duration: Duration(seconds: 1)),
            );
          }
          else {
            sigin_loading.value = false;
            Get.defaultDialog(
                title: 'Thông báo',
                middleText: '${result.msg}!',
                textConfirm: 'Xác nhận',
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.back();
                }
            );

          }
        }
      }
      catch(error){
        sigin_loading.value = false;
        Get.defaultDialog(
            title: 'Thông báo',
            middleText: '${error}!',
            textConfirm: 'Xác nhận',
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            }
        );
      }
  }

  Future<void> registerUser(User user) async {
    register_loading.value = false;
    try{
      final result = await HomePageRepo().createUser(user.toJsonRegister());
      if(result != null){
        if(result.isSuccess){
          await loginUser(user);
          register_loading.value = true;
          Get.back();
          scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Đăng ký thành công!'), duration: Duration(seconds: 1)),
          );
        } else{
          register_loading.value = true;
          Get.defaultDialog(
              middleText: 'Đăng ký thất bại',
              title:  '${result.msg}',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              }
          );
        }
      }
    }catch(error){
      print(error);
    }
  }

  changeObscurePassword(value) => isObscurePassword.value = value;
  changeRegisterObscurePassword(value) => isRegisterObscurePassword.value = value;

}