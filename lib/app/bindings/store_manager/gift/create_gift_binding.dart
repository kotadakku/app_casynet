import 'package:get/get.dart';

import '../../../controller/store_manager/gift/create_gift_controller.dart';

class CreateGiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateGiftController());
  }

}