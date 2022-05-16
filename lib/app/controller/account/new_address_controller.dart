
import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data.dart';
import '../../data/model/address.dart';
import '../../data/provider/address_api_provider.dart';
import '../auth/cache_manager.dart';


class NewAddressController extends GetxController{
  late final AuthenticationManager _authManager;
  var switch_default = true.obs;
  late var formStateKey;
  late Address address;

  RxList provinces = [].obs;
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
    textProvinceCotroller = TextEditingController();
    textDistrictController = TextEditingController();
    textCommuneController = TextEditingController();
    (data['province'] as List).forEach((e){
      provinces.add({ 'id': e['idProvince'],'name': e['name'].toString()});
    }

    );
  }

  void postAddress(Address address){
    AddressProvider().createAddress(
      token: GetStorage().read(CacheManagerKey.TOKEN.toString()),
      onSuccess: (data) async{
        if(data != null){
          // await _authManager.login();
          // await _authManager.login(data.decode);
          // Get.back();
        }
        print("Success ${data.toJson()}");
      },
      onError: (error){
        Get.defaultDialog(
          middleText: '$error',
          textConfirm: 'Ok',
          confirmTextColor: Colors.white,
          onConfirm: (){
            Get.back();
          }
        );
        print(error);
      },
      data: address.toJson(),
      address: address);
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