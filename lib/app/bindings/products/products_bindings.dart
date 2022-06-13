import 'package:get/get.dart';

import '../../controller/products/products_controller.dart';
import '../../controller/products/products_controller.dart';

class ProductsBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}