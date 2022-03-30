import 'package:app_casynet/controller/radio_car_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RadioController());
    Get.lazyPut(() => BannerController());
  }
}

class BannerController extends GetxController{
  var current = 0.obs;
}
