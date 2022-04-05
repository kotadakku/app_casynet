import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/account/information_address_controller.dart';
import '../controller/detail_app_controller.dart';
import '../controller/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true );
    Get.lazyPut(() => DetailAppController(), fenix: true );
    Get.put(InformationAddressController());
  }
}