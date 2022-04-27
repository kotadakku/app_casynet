import 'package:get/get.dart';

import '../controller/home/products_controller.dart';

class ProductsBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}