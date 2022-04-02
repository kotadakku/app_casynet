import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../controller/detail_product_controller.dart';

class DetailProductBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => BannerProductController());
  }
}