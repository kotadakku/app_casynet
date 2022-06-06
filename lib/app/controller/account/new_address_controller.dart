
import 'dart:convert';

import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:app_casynet/app/data/provider/get_storage_provider.dart';
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data.dart';
import '../../data/model/address.dart';
import '../../data/model/user.dart';
import '../../data/repo/address_repo.dart';
import '../../utlis/data/data.dart';


class NewAddressController extends GetxController {
  late final AuthenticationManager _authManager;
  var switch_default = true.obs;
  late var formStateKey;
  late Address address;
  late Province _province;
  // late DataAddress address;
  // late City city;

  final isLoadAPI = false.obs;
  final error = "".obs;

  RxList provinces = <Province>[].obs;
  RxList districts = [].obs;
  RxList communes = [].obs;

  RxString province = "".obs;
  RxString district = "".obs;
  RxString commune = "".obs;

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
    _province = Province();
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

  Future<void> getProvince(Province new_province) async {
    isLoadAPI.value = true;
    error.value = " ";
    try{
      // String? token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
      final result = await AddressRepo().getDataAddress();
      if(result != null){
        if(result.isSuccess){
          provinces.value = result.listObjects ?? [];

          isLoadAPI.value = false;
          if(provinces.length <= 0){
            error.value = "không có Tỉnh/ Thành phố nào";
            return;
          }
        }
      }
    }catch(error){
      Get.snackbar("Thông báo", "error:: $error",
          backgroundColor: Colors.black.withOpacity(0.3));
    }
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

  void updateDistrict(String idProvince){
    districts.clear();
    communes.clear();
    (data['district'] as List).forEach((e){
      if(e["idProvince"] == idProvince)
        districts.add({'id': e['idDistrict'],'name': e['name'].toString()});
    });
  }

  void updateCommune(String idDistrict ){
    communes.clear();

    (data['commune'] as List).forEach((e){
      if(e["idDistrict"] == idDistrict)
        communes.add({ 'id': e['idCommune'],'name': e['name'].toString()});
    });
  }
}