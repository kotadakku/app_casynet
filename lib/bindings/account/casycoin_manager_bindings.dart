import 'package:app_casynet/controller/account/casycoin_manager_controller.dart';
import 'package:get/get.dart';

class CasycoinManagerBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CasycoinManagerController());
  }
}