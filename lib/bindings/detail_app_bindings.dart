import 'package:get/get.dart';

import '../controller/detail_app_controller.dart';

class DetailAppBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailAppController());
  }

}

