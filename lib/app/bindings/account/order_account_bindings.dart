import 'package:get/get.dart';

import '../../controller/account/fetch_order_controller.dart';
import '../../controller/account/order_account_controller.dart';

class OrderAccountBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => OrderAccountController());
    Get.put(FetchOrderController());
  }
}