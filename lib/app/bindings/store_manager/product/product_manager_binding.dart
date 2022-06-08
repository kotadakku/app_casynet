import 'package:app_casynet/app/controller/store_manager/product/select_origin_controller.dart';
import 'package:get/get.dart';

import '../../../controller/store_manager/product/add_product_controller.dart';
import '../../../controller/store_manager/product/select_category_controller.dart';

class ProductManagerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddProductController());
    Get.put(SelectOriginController());
  }
}