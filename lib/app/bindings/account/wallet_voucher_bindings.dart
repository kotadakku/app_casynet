import 'package:get/get.dart';
import 'package:app_casynet/app/controller/controller.dart';

class WalletVoucherBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => WalletVoucherController());
    Get.lazyPut(() => VoucherController());
  }
}