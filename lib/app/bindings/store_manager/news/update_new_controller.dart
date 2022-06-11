import 'package:app_casynet/app/controller/store_manager/news/update_new_controller.dart';
import 'package:get/get.dart';

class UpdateNewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateNewController(), fenix: true);
  }

}