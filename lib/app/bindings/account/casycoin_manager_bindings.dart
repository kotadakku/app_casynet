
import 'package:get/get.dart';

import '../../controller/account/casycoin_manager_controller.dart';

class CasycoinManagerBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CasycoinManagerController());
  }
}