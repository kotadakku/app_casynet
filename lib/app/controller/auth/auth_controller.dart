import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/user.dart';
import '../../data/provider/auth_provider.dart';

class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
  late final AuthenticationManager _authManager;
  late TabController controller;

  final GlobalKey<FormState>loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';


  @override
  void onInit() {
    super.onInit();
    _authManager = Get.find();
    int index = Get.arguments;
    controller = TabController(length:2, vsync: this, initialIndex: index);
    emailController = TextEditingController();
    passwordController = TextEditingController();

  }


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
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
    AuthProvider().fetchLogin(user: user,
        onSuccess: (data){
          print(data);
          if(data!=null){
            _authManager.login(data.token);
          }
          else {
            /// Show user a dialog about the error response
            print('User not found!');
            Get.defaultDialog(
                middleText: 'User not found!',
                textConfirm: 'OK',
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.back();
                });
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

  Future<void> registerUser(User user) async {
    AuthProvider().fetchRegister(user: user,
        onSuccess: (data){

          if(data!=null){
            _authManager.login(data.token);
          }
          else {
            /// Show user a dialog about the error response
            Get.defaultDialog(
                middleText: 'Register Error',
                textConfirm: 'OK',
                confirmTextColor: Colors.white,
                onConfirm: () {
                  Get.back();
                });
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

}