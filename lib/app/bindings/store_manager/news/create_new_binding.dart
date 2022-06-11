import 'package:app_casynet/app/controller/store_manager/news/create_new_controller.dart';
import 'package:get/get.dart';

class CreateNewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNewController(), fenix: true);
  }

}