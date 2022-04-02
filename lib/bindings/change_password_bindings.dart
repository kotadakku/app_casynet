import 'package:app_casynet/controller/account/change_password_controller.dart';
import 'package:get/get.dart';

class ChangePasswordBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }

}