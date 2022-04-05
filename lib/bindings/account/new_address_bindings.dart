import 'package:app_casynet/controller/account/new_address_controller.dart';
import 'package:get/get.dart';

class NewAddressBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => NewAddressController());
  }
}