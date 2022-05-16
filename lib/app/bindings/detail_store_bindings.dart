import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/store_detail/detail_store_controller.dart';


class DetailStoreBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailStoreController());
  }
}