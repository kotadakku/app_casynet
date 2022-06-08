

import 'package:app_casynet/app/controller/store/new_created_store_controller.dart';
import 'package:get/get.dart';

import '../../controller/store/create_seller_controller.dart';

class NewSellerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateSellerController());
    Get.lazyPut(() => NewCreatedStoreController());
  }

}