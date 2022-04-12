import 'package:get/get.dart';

class AccountPageController extends GetxController{
  RxBool isAuth = true.obs;

  void logout(){
    print("logout");
  }
}