
import 'package:app_casynet/app/controller/cart/api/product_cart_controller.dart';
import 'package:app_casynet/app/data/provider/api/api_provider.dart';
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/user.dart';
import 'cache_manager.dart';


class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  late User user_current = User();
  ProductCartController _ProductCartController = Get.put(
      ProductCartController());

  void logOut() {
    isLogged.value = false;
    removeUser();
    removeToken();
    _ProductCartController.clearCart();
  }

  Future<void> login(String? token, User user) async {
    if (token != null) {
      saveToken(token);
      saveInfoLogin(user.toJsonLogin());
      await fetchUserAPI(token);
      _ProductCartController.getCartAPI(token);
      isLogged.value = true;
    }
  }

  Future<void> fetchUserAPI(String token) async {
    print("<AUTH> GET API");
    Options opt = Options(
        headers: {'Authorization': 'Bearer $token'}
    );

    final result = await HomePageRepo().getUser(opt);
    if (result != null) {
      if (result.isSuccess && result.objects != null) {
        user_current = result.objects!;
        saveUsers(user_current.toJsonUserDb());
      }
      else {
        print(result.msg);
        logOut();
      }
    }
  }

  Future<void> getDataUser(String token) async {
    final user = getUsers();

    if (user != null) {
      print("<AUTH> GET DB");
      user_current = user;
    }
    else {
      fetchUserAPI(token);
      _ProductCartController.getCartAPI(token);
    }
  }
  void checkLoginStatus() {
    final token = getToken();

    if (token != null) {
      getDataUser(token);
      isLogged.value = true;
    }
    print(isLogged.value);
  }
}