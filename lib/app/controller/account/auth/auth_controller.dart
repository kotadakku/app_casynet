
import 'dart:io';

import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/routes/app_pages.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:app_casynet/app/data/data.dart';
import 'authentication_manager.dart';

class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
  late final AuthenticationManager _authManager;
  late TabController controller;
  var sigin_loading = false.obs;
  var register_loading = false.obs;
  final isSending = false.obs;

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
        final result = await UserRepo().getTokenUser(
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
      final result = await UserRepo().createUser(user.toJsonRegister());
      if(result != null){
        if(result.isSuccess){
          register_loading.value = false;
          controller.animateTo(0,
            duration: Duration(seconds: 1),
            curve: Curves.easeInBack
          );
          scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('????ng k?? th??nh c??ng!'), duration: Duration(seconds: 1)),
          );
        } else{
          Get.defaultDialog(
              title: '????ng k?? th???t b???i',
              middleText:  '${result.msg}',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
                if(result.msg == 'S??? ??i???n tho???i ???? ???????c ????ng k??'){
                  focusNodePhone.requestFocus();
                }
                if(result.msg == 'Email n??y ???? t???n t???i!'){
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

  void resetPassword(String email) async {
    isSending.value = true;
    final result = await UserRepo().resetPassword(email: email,
    );
    if(result.statusCode == CODE_SUCCESS){
      if(result.objects==true){
        isSending.value = false;
        Get.defaultDialog(
            title: 'noti'.tr,
            middleText: 'Vui l??ng check l???i mail v?? ????ng nh???p l???i sau!!',
            textConfirm: 'confirm'.tr,
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.toNamed(Routes.AUTH, arguments: 0);
            },

        );

      }else{
        isSending.value = false;
        Get.defaultDialog(
            title: 'noti'.tr,
            middleText: 'Email kh??ng h???p l???!',
            textConfirm: 'confirm'.tr,
            confirmTextColor: Colors.white,
            onConfirm: () {
              Get.back();
            },
        );
      }
    }else{
      isSending.value = false;
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
  }


  void showDateBirthdayPicker(BuildContext context) {
    if(Platform.isAndroid){
      showDatePicker(
        context: context,
        initialDate: DateTime.now().subtract(Duration(days:1)),
        firstDate: DateTime(1900),
        lastDate: DateTime.now().subtract(Duration(days:1)),
      ).then((value){
        birthDayTextController.text = DateFormat("yyyy/MM/dd").format(value!);
      });
    }
    else{
      showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: SafeArea(
              top: false,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now().subtract(Duration(days:1)),
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                // This is called when the user changes the date.
                onDateTimeChanged: (DateTime newDate) {
                  birthDayTextController.text = DateFormat("yyyy/MM/dd").format(newDate);
                },
              ),
            ),
          ));
    }
  }

}