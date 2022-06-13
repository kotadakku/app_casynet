
import 'package:app_casynet/app/controller/account/auth/authentication_manager.dart';
import 'package:app_casynet/app/data/provider/get_storage_provider.dart';
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/address.dart';
import '../../../data/model/user.dart';
import '../auth/authentication_manager.dart';


class NewAddressController extends GetxController {
  late final AuthenticationManager _authManager;
  var switch_default = true.obs;
  late var formStateKey;
  late Address address;

  late TextEditingController textProvinceCotroller;
  late TextEditingController textDistrictController;
  late TextEditingController textCommuneController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _authManager = Get.put(AuthenticationManager());
    formStateKey = GlobalKey<FormState>();
    address = Address();
    // city = City();
    // address = DataAddress();
    textProvinceCotroller = TextEditingController();
    textDistrictController = TextEditingController();
    textCommuneController = TextEditingController();

    // (data['province'] as List).forEach((e){
    //   provinces.add({ 'id': e['idProvince'],'name': e['name'].toString()});
    // }
    //
    // );
  }

  void createAddress(Address new_address) async {
    try{
      String? token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
      final result = await HomePageRepo().updateAddress(
        data: new_address.toJsonAddress(),
        options: Options(
          headers: {
            'Authorization' : 'Bearer $token'
          }
        )
      );
      if(result != null){
        if(result.isSuccess){
          _authManager.user_current = result.objects ?? User();
        }
        else{
          Get.snackbar('noti'.tr, "${result.msg}");
        }
      }
    }catch(error){
      Get.snackbar('noti'.tr, "error:: $error",
          backgroundColor: Colors.black.withOpacity(0.3));
    }
  }
}