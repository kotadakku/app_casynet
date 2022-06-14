import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/address.dart';
import '../auth/authentication_manager.dart';
import '../auth/authentication_manager.dart';

class EditAddressController extends GetxController{
  var switch_default = true.obs;
  late var formStateKey;
  late Address address;
  late final AuthenticationManager _authManager;
  late TextEditingController textProvinceCotroller;
  late TextEditingController textDistrictController;
  late TextEditingController textCommuneController;

  @override
  void onInit() {
    _authManager = Get.put(AuthenticationManager());
    formStateKey = GlobalKey<FormState>();
    if(Get.arguments[0] != null){
      address = Get.arguments[0];
    }
    textProvinceCotroller = TextEditingController(text: address.province);
    textDistrictController = TextEditingController(text: address.district);
    textCommuneController = TextEditingController(text: '');
    switch_default.value = address.default_shipping;
  }

  void updateAddress(int id){
    // AddressProvider().updateAddress(
    //     onSuccess: (data){
    //       print("Success ${data.toJson()}");
    //     },
    //     onError: (error){
    //       print(error);
    //     },
    //     data: address.toJson(),
    //     id: id);
  }
  void deleteAddress(int id){
  //   print(id);
  //  AddressProvider().deleteAddress(onSuccess: (data){
  //    print(data);
  //  }, id: id
  //  );
   }
}