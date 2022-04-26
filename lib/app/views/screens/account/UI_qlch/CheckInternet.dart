

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class checkinternet extends GetxController{
  var satatusinternet="No Internet".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Connectivity().onConnectivityChanged.listen((result){
      if(result==ConnectivityResult.wifi || result==ConnectivityResult.mobile){
        satatusinternet.value="";
      }else{
        satatusinternet.value="No Internet";
      }
    });
  }
}