import 'package:get/get.dart';

import '../../../controller/store_manager/product/add_product_controller.dart';
import '../../../controller/store_manager/product/select_origin_controller.dart';

class CreateProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddProductController());
    Get.put(SelectOriginController());
  }

}