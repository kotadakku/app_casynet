import 'package:get/get.dart';

import '../../../controller/store_manager/seller/update_seller_controller.dart';

class UpdateSellerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateSellerController());
  }

}