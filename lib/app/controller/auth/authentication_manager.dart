
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/user.dart';
import '../../data/provider/auth_provider.dart';
import '../../routes/app_pages.dart';
import 'cache_manager.dart';


class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  late User user_current = User();



  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    //Token is cached
    await saveToken(token);
    fetchUser(token);
    isLogged.value = true;
  }

  void registerUser(User user){
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
  }

  Future<void> fetchUser(String? token ) async {
    AuthProvider().fetchCurrentUser(
        token: token,
        onSuccess: (data) {
          if (data != null) {
            user_current = data;
            user_current.token = token;
            update();
          }
        },
        onError: (error) {
          print(error);
          logOut();
        }
    );
  }


  void checkLoginStatus() {
    final token = getToken();
    print(token);
    if (token != null) {
      fetchUser(token);
      isLogged.value = true;
    }
    print(isLogged.value);
  }
}