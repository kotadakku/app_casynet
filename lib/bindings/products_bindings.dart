

import 'package:app_casynet/controller/products_controller.dart';
import 'package:get/get.dart';

class ProductsBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}