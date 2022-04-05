import 'package:get/get.dart';

import '../../data/provider/address_provider.dart';

class InformationAddressController extends GetxController{
  RxList addressList = [].obs;

  @override
  void onInit() {
    AddressProvider().fetchAddressList(onSuccess: (data){
      addressList.addAll(data);
    },
    onError: (error){
      print(error);
    }
    );
  }
}