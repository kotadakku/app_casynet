
import 'package:get/get.dart';

import '../../controller/account/account_page_controller.dart';

class AccountPageBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => AccountPageController);
  }
}