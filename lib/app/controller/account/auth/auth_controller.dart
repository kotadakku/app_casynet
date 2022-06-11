
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/user.dart';
import 'authentication_manager.dart';

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
  final focusNodeEmail = FocusNode();
  final focusNodePhone = FocusNode();


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
    controller.dispose();
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
              SnackBar(content: Text('login_success'.tr), duration: Duration(seconds: 1)),
            );
          }
          else {
            sigin_loading.value = false;
            Get.defaultDialog(
                title: 'noti'.tr,
                middleText: '${result.msg}!',
                textConfirm: 'confirm'.tr,
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
            title: 'noti'.tr,
            middleText: '${error}!',
            textConfirm: 'confirm'.tr,
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            }
        );
      }
  }

  Future<void> registerUser(User user) async {
    register_loading.value = true;
    try{
      final result = await HomePageRepo().createUser(user.toJsonRegister());
      if(result != null){
        if(result.isSuccess){
          register_loading.value = false;
          controller.animateTo(0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInBack
          );
          scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Đăng ký thành công!'), duration: Duration(seconds: 1)),
          );
        } else{
          Get.defaultDialog(
              title: 'Đăng ký thất bại',
              middleText:  '${result.msg}',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
                if(result.msg == 'Số điện thoại đã được đăng ký'){
                  focusNodePhone.requestFocus();
                }
                if(result.msg == 'Email này đã tồn tại!'){
                  focusNodeEmail.requestFocus();
                }
                register_loading.value = false;
              }
          );
        }
      }
    }catch(error){
      register_loading.value = false;
      print(error);
    }
  }

  changeObscurePassword(value) => isObscurePassword.value = value;
  changeRegisterObscurePassword(value) => isRegisterObscurePassword.value = value;

}