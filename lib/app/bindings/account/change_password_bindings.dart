
import 'package:get/get.dart';

import '../../controller/account/account_detail/change_password_controller.dart';


class ChangePasswordBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }

}