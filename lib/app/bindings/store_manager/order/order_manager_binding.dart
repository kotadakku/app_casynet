import 'package:app_casynet/app/controller/store_manager/order/order_manager_api_controller.dart';
import 'package:get/get.dart';

class OrderManagerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OrderManagerApiController());
  }

}