import 'package:app_casynet/app/controller/store_manager/order/detail_order_controller.dart';
import 'package:get/get.dart';

class DetailOrderBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailOrderController(), fenix: true);
  }
}