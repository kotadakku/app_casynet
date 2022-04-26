import 'package:get/get.dart';

import '../../controller/account/wallet_voucher_controller.dart';

class WalletVoucherBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WalletVoucherController());
  }
}