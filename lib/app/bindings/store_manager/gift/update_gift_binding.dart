import 'package:get/get.dart';

import '../../../controller/store_manager/gift/update_gift_controller.dart';

class UpdateGiftBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateGiftController());
  }

}