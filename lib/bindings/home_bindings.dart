import 'package:app_casynet/controller/cuahang_controller.dart';
import 'package:app_casynet/controller/datcho_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/account/information_address_controller.dart';
import '../controller/authentication_manager.dart';
import '../data/service/connectivity_service.dart';
import '../controller/detail_app_controller.dart';
import '../controller/home_controller.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.lazyPut(() => DetailAppController(), fenix: true );
    Get.put(InformationAddressController());
    Get.put(ConnectivityService());
    Get.put(CuaHangController());
    Get.put(DetailAppController());
    Get.put(DatChoController());
    Get.put(AuthenticationManager());
  }
}