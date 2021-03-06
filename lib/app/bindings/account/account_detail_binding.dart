import 'package:get/get.dart';

import '../../controller/account/account_detail/account_detail_controller.dart';
import '../../controller/account/account_detail/edit_info_controller.dart';

class AccountDetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AccountDetailController());
    Get.lazyPut(() => EditInfoController(), fenix: true);
  }

}