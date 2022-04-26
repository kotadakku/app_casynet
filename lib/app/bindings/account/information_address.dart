
import 'package:get/get.dart';

import '../../controller/account/information_address_controller.dart';

class InformationAddressBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => InformationAddressController());
  }
  
}