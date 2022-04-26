import 'package:get/get.dart';

import '../authentication_manager.dart';

class AccountPageController extends GetxController{
  RxBool isAuth = true.obs;

  void logout(){
    AuthenticationManager authenticationManager = Get.find();
    authenticationManager.logOut();
    print("logout");
  }
}