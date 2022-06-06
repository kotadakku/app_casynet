

import 'package:get/get.dart';

import '../../controller/store/create_seller_controller.dart';

class NewSellerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateSellerController());
  }

}