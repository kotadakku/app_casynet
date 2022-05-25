
import 'package:app_casynet/app/controller/home/api/seller_controller.dart';
import 'package:app_casynet/app/controller/home/stores_controller.dart';
import 'package:get/get.dart';

import '../controller/load_more_data/seller_loadmore_controller.dart';

class StoresBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => StoresMoreController());
    Get.put(SellerController());
    Get.lazyPut(() => SellerLoadMoreController());
  }
}