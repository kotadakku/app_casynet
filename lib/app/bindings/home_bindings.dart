import 'package:app_casynet/app/controller/home/search_controller.dart';
import 'package:get/get.dart';


class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}