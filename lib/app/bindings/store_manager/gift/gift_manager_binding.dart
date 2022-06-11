import 'package:get/get.dart';

import '../../../controller/store_manager/gift/gift_manager_controller.dart';

class GiftManagerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GiftManagerController());
  }

}