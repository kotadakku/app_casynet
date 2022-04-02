import 'package:get/get.dart';
import '../controller/filter_product_controller.dart';

class FilterProductBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FilterDisplayController());
    Get.lazyPut(() => FilterAttrController());
    Get.lazyPut(() => FilterCategoriesController());
    Get.lazyPut(() => FilterDistrictController());
    Get.lazyPut(() => FilterPriceController());
    Get.lazyPut(() => FilterOriginController());
  }

}