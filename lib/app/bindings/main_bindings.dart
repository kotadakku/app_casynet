import 'package:get/get.dart';
import '../controller/account/information_address_controller.dart';
import '../controller/account/new_address_controller.dart';
import '../controller/auth/authentication_manager.dart';
import '../controller/home/banner_page_view_controller.dart';
import '../controller/home/cuahang_controller.dart';
import '../controller/detail_app_controller.dart';
import '../controller/home/datcho_controller.dart';
import '../controller/home/fetch_banner_controller.dart';
import '../controller/home/fetch_topsales_controller.dart';
import '../controller/home/home_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.lazyPut(() => BannerController());
    Get.lazyPut(() => DetailAppController(), fenix: true );
    Get.put(NewAddressController());
    Get.put(InformationAddressController());
    // Get.put(ConnectivityService());
    Get.put(CuaHangController());
    Get.put(DetailAppController());
    Get.put(DatChoController());
    Get.put(AuthenticationManager());
    Get.put(FetchBannerController());
    Get.put(FetchTopSalesController());
  }
}