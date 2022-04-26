import 'package:get/get.dart';

import '../../controller/account/order_account_controller.dart';

class OrderAccountBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => OrderAccountController());
  }
}