import 'package:get/get.dart';

import '../../controller/account/edit_address_controller.dart';

class EditAddressBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => EditAddressController());
  }
}