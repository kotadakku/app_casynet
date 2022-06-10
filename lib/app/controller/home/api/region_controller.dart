import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repo/address_repo.dart';
import '../../../utlis/data/data.dart';

class RegionController extends GetxController{
  final isLoadAPI = false.obs;
  final error = "".obs;

  RxList provinces = <Province>[].obs;
  RxList districts = [].obs;
  RxList communes = [].obs;

  RxString province = "".obs;
  RxString district = "".obs;
  RxString commune = "".obs;

  @override
  void onInit() {
    getProvinceApi();
  }
  Future<void> getProvinceApi() async {
    isLoadAPI.value = true;
    error.value = " ";
    try{
      // String? token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
      final result = await AddressRepo().getProvinces(
          queryParameters: {
            "countryId": 1,
          }
      );
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
  Future<void> getDistrictsApi(int provinceId) async {
    isLoadAPI.value = true;
    error.value = " ";
    communes.clear();
    try{
      final result = await AddressRepo().getDistricts(
          queryParameters: {
            "provinceId": provinceId
          }
      );
      if(result != null){
        if(result.isSuccess){
          districts.value = result.listObjects ?? [];

          isLoadAPI.value = false;
          if(districts.length <= 0){
            error.value = "không có Quận/ Huyện nào";
            return;
          }
        }
      }
    }catch(error){
      Get.snackbar("Thông báo", "error:: $error",
          backgroundColor: Colors.black.withOpacity(0.3));
    }
  }

  Future<void> getVillagesApi(int districtId) async {
    isLoadAPI.value = true;
    error.value = " ";
    try{
      final result = await AddressRepo().getVillages(
          queryParameters: {
            "districtId": districtId
          }
      );
      if(result != null){
        if(result.isSuccess){
          communes.value = result.listObjects ?? [];

          isLoadAPI.value = false;
          if(communes.length <= 0){
            error.value = "không có Xã/ Phường nào";
            return;
          }
        }
      }
    }catch(error){
      Get.snackbar("Thông báo", "error:: $error",
          backgroundColor: Colors.black.withOpacity(0.3));
    }
  }

  // void updateDistrict(String idProvince){
  //   districts.clear();
  //   communes.clear();
  //   (data['district'] as List).forEach((e){
  //     if(e["idProvince"] == idProvince)
  //       districts.add({'id': e['idDistrict'],'name': e['name'].toString()});
  //   });
  // }
  //
  // void updateCommune(String idDistrict ){
  //   communes.clear();
  //
  //   (data['commune'] as List).forEach((e){
  //     if(e["idDistrict"] == idDistrict)
  //       communes.add({ 'id': e['idCommune'],'name': e['name'].toString()});
  //   });
  // }

}