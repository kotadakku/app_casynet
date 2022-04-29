import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/address.dart';
import '../../data/provider/address_api_provider.dart';

class EditAddressController extends GetxController{
  var switch_default = true.obs;
  late var formStateKey;
  late Address address;

  @override
  void onInit() {
    formStateKey = GlobalKey<FormState>();
    address = Address();
  }



  void updateAddress(int id){

    AddressProvider().updateAddress(
        onSuccess: (data){
          print("Success ${data.toJson()}");
        },
        onError: (error){
          print(error);
        },
        data: address.toJson(), id: id);
  }
  void deleteAddress(int id){
    print(id);
   AddressProvider().deleteAddress(onSuccess: (data){
     print(data);
   }, id: id
   );
  }
}