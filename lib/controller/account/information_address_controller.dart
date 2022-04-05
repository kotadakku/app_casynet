import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/provider/address_provider.dart';

class InformationAddressController extends GetxController{
  var addressList = [];

  void onInit() {
    AddressProvider().fetchAddressList(onSuccess: (data){
      addressList.addAll(data);
      update();
    },
    onError: (error){
      print(error);
    }
    );
  }

  void updateAddress(){
    AddressProvider().fetchAddressList(onSuccess: (data){
      addressList.clear();
      addressList.addAll(data);
      update();
    },
        onError: (error){
          print(error);
        }
    );
  }
}