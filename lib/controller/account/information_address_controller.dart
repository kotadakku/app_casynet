import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/provider/address_provider.dart';

class InformationAddressController extends GetxController{
  var addressList = [];
  var controller = ScrollController();

  @override
  void onInit() {
    controller.addListener(() {
      if (controller.position.atEdge) {
        bool isTop = controller.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          print('At the bottom');
        }
      }
      else{
        print('At the bottom');
      }
    });
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