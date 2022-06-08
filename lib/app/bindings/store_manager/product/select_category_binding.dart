import 'package:get/get.dart';

import '../../../controller/store_manager/product/select_category_controller.dart';

class SelectCategoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SelectCategoryController());
  }

}