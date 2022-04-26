
import 'package:get/get.dart';

import '../controller/account/change_password_controller.dart';

class ChangePasswordBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }

}