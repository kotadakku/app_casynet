
import 'package:app_casynet/app/controller/stores/stores_controller.dart';
import 'package:get/get.dart';

class StoresBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => StoresController());
  }
}