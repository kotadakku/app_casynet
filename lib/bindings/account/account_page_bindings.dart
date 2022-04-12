import 'package:app_casynet/controller/account/account_page_controller.dart';
import 'package:get/get.dart';

class AccountPageBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => AccountPageController);
  }
}