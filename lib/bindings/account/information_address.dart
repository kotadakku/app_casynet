import 'package:app_casynet/controller/account/information_address_controller.dart';
import 'package:get/get.dart';

class InformationAddressBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => InformationAddressController());
  }
  
}