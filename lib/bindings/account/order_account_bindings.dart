import 'package:app_casynet/controller/account/order_account_controller.dart';
import 'package:get/get.dart';

class OrderAccountBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => OrderAccountController());
  }
}