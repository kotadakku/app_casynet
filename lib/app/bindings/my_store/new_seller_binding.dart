

import 'package:app_casynet/app/controller/store/other_category_controller.dart';
import 'package:app_casynet/app/controller/store/other_category_controller.dart';
import 'package:app_casynet/app/controller/store/region_store_controller.dart';
import 'package:get/get.dart';

import '../../controller/store/create_seller_controller.dart';

class NewSellerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateSellerController());
    Get.lazyPut(() => OtherCategoryController());
    Get.lazyPut(() => RegionStoreController());
  }

}