import 'package:app_casynet/app/controller/account/search_controller.dart';
import 'package:app_casynet/app/controller/home/banner_controller.dart';
import 'package:get/get.dart';

import '../controller/home/radio_controller.dart';



class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BannerController());
    Get.lazyPut(() => RadioController());
    Get.put(SearchController());
  }
}