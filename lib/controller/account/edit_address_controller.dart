import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/address.dart';
import '../../data/provider/address_provider.dart';

class EditAddressController extends GetxController{
  var switch_default = true.obs;
  late var formStateKey;
  late Address address;

  @override
  void onInit() {
    formStateKey = GlobalKey<FormState>();
    address = Address.init(0,'', '', '', '', '', false);
  }



  void updateAddress(int id){

    AddressProvider().updateAddress(
        onSuccess: (data){
          print("Success ${data.toJson(data)}");
        },
        onError: (error){
          print(error);
        },
        data: address.toJson(address), id: id);
  }
  void deleteAddress(int id){
    print(id);
   AddressProvider().deleteAddress(onSuccess: (data){
     print(data);
   }, id: id
   );
  }
}