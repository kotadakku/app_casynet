
import 'package:app_casynet/app/controller/home/banner_controller.dart';
import 'package:get/get.dart';



class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BannerController(), fenix: true);
  }
}