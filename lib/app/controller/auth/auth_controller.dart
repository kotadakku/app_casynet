import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/user.dart';
import '../../data/provider/auth_provider.dart';
import '../../routes/app_pages.dart';

class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
  late final AuthenticationManager _authManager;
  late TabController controller;
  var sigin_loading = false.obs;

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

  void loginUser(User user) {
      sigin_loading.value = true;
     AuthProvider().fetchLogin(user: user,
        onSuccess: (data) async {
          if(data!=null){
            await _authManager.login(data, user);
            sigin_loading.value = false;
            Get.offNamed(Routes.HOME);
            scaffoldMessenger.showSnackBar(
              const SnackBar(content: Text('Đăng nhập thành công'), duration: Duration(seconds: 1)),
            );
          }
          else {
            /// Show user a dialog about the error response
            print('User not found!');
            Get.defaultDialog(
                middleText: 'Không tìm thấy người dùng!',
                textConfirm: 'Xác nhận',
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.back();
                });
          }
        },
        onError: (error) {
          Get.defaultDialog(
              title: 'Thông báo',
              middleText: '$error!',
              textConfirm: 'Xác nhận',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
            });
          sigin_loading.value = false;
        }
    );
  }

  Future<void> registerUser(User user) async {
    await AuthProvider().fetchRegister(user: user,
        onSuccess: (data) async {
          if(data!=null){
            await _authManager.login(data.token, user);
            Get.back();
          }
          else {
            /// Show user a dialog about the error response
            Get.defaultDialog(
              middleText: 'Register Error',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              }
            );
          }
        },
        onError: (error) {
          Get.defaultDialog(
              middleText: '$error!',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
        }
    );
  }

  changeObscurePassword(value) => isObscurePassword.value = value;
  changeRegisterObscurePassword(value) => isRegisterObscurePassword.value = value;

}