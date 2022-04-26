import 'package:get/get.dart';
import '../controller/account/information_address_controller.dart';
import '../controller/authentication_manager.dart';
import '../controller/home/cuahang_controller.dart';
import '../controller/detail_app_controller.dart';
import '../controller/home/datcho_controller.dart';
import '../controller/home/home_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.lazyPut(() => DetailAppController(), fenix: true );
    Get.put(InformationAddressController());
    // Get.put(ConnectivityService());
    Get.put(CuaHangController());
    Get.put(DetailAppController());
    Get.put(DatChoController());
    Get.put(AuthenticationManager());
  }
}