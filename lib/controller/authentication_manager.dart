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
  late User user_current;


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
        fetchCurrentUser(data.token);
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
    print("${user.email}, ${user.password}, ${user.username}");
    AuthProvider().fetchRegister(user: user,
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
    Get.back();
  }

  fetchCurrentUser(token){
    AuthProvider().fetchCurrentUser(
        token: token,
        onSuccess: (data){

          if(data!=null){
            login(data.token);
            user_current = data;
            update();
          }
        },
        onError: (error) {
          print(error);
          // Get.defaultDialog(
          //     middleText: '$error!',
          //     textConfirm: 'OK',
          //     confirmTextColor: Colors.white,
          //     onConfirm: () {
          //       Get.back();
          //     });
        }
    );
  }


  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      fetchCurrentUser(token);
      isLogged.value = true;
    }
  }
}