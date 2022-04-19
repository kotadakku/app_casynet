import 'dart:convert';

import 'package:app_casynet/data/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/model/user.dart';
import '../data/provider/cache_manager.dart';


class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  GlobalKey<FormState> formSignInKey = GlobalKey<FormState>();
  GlobalKey<FormState> formRegisterKey = GlobalKey<FormState>();


  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void loginUser(User user){
    AuthProvider().fetchLogin(user: user,
      onSuccess: (data){
      if(data!=null){
        login(data.token);
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

  void registerUser(User user){
    AuthProvider().fetchRegister(user: user,
        onSuccess: (data){
          print(data.token);

          if(data!=null){
            login(data.token);
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


  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}