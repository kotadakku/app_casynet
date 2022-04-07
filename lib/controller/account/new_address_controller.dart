import 'package:app_casynet/data/provider/address_api_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/address.dart';

class NewAddressController extends GetxController{
  var switch_default = true.obs;
  late var formStateKey;
  late Address address;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    formStateKey = GlobalKey<FormState>();
    address = Address.init(0, '', '', '', '', '', false);
  }

  void postAddress(){
    AddressProvider().createAddress(
      onSuccess: (data){
        print("Success ${data.toJson()}");
      },
      onError: (error){
        print(error);
      },
      data: address.toJson());
  }
}