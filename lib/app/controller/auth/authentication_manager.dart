
import 'dart:convert';

import 'package:app_casynet/app/controller/cart/api/product_cart_controller.dart';
import 'package:app_casynet/app/data/provider/api/api_provider.dart';
import 'package:app_casynet/app/data/provider/get_storage_provider.dart';
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/user.dart';


class AuthenticationManager extends GetxController {
  final isLogged = false.obs;
  late User user_current = User();
  ProductCartController _ProductCartController = Get.put(
      ProductCartController());

  void logOut() {
    isLogged.value = false;
    GetStorageProvider().delete(key: CacheManagerKey.TOKEN.toString());
    GetStorageProvider().delete(key: CacheManagerKey.USER.toString());
    GetStorageProvider().delete(key: CacheManagerKey.USER_LOGIN.toString());
    _ProductCartController.clearCart();
  }

  Future<void> login(String? token, User user) async {
    if (token != null) {
      await GetStorageProvider().save(
          key: CacheManagerKey.TOKEN.toString(),
          value: token);
      await GetStorageProvider().save(
        key: CacheManagerKey.USER_LOGIN.toString(),
        value: json.encode(user.toJsonLogin())
      );
      await fetchUserAPI(token);
      isLogged.value = true;
      _ProductCartController.getCartAPI(token);
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
      }
      else {
        print(result.msg);
        logOut();
      }
    }
  }

  Future<void> getDataUser(String token) async {
    final stringUser = await GetStorageProvider().get(key: CacheManagerKey.USER.toString());


    if (stringUser != null) {
      print("<AUTH> GET DB");
      user_current = User.successLogin(json.decode(stringUser));
    }
    else {
      fetchUserAPI(token);
      _ProductCartController.getCartAPI(token);
    }
  }
  void checkLoginStatus() async {
    final token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());

    if (token != null) {
      getDataUser(token);
      isLogged.value = true;
    }
    print(isLogged.value);
  }
}