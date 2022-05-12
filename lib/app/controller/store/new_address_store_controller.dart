
import 'package:app_casynet/app/data/model/address.dart';
import 'package:app_casynet/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddressShopController extends GetxController{

  late var formStateKer;
  late Address addressShop;

  RxList provinceShops = [].obs;
  RxList districtShops = [].obs;
  RxList communeShops = [].obs;

  RxString provinceShop = "".obs;
  RxString districtShop = "".obs;
  RxString communeShop = "".obs;

  @override
  void onInit() {
    super.onInit();

    formStateKer = GlobalKey<FormState>();
    addressShop = Address();

    (data['province'] as List).forEach((e) {
      provinceShops.add({'id': e['idProvince'],'name': e['name'].toString()});
    });
  }

  void postAddress(){

  }

  void updateDistrictShop(String idProvince){
    districtShops.clear();
    communeShops.clear();
    (data['district'] as List).forEach((e) {
      if(e["idProvince"] == idProvince)
        districtShops.add({'id': e['idDistrict'], 'name': e['name'].toString()});
    });
  }

  void updateCommuneShop(String idDistrict){
    // communeShops.clear();

    (data['commune'] as List).forEach((e){
      if(e["idDistrict"] == idDistrict)
        communeShops.add({ 'id': e['idCommune'],'name': e['name'].toString()});
    });

  }
}