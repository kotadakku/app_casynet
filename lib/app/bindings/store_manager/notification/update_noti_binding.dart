import 'package:app_casynet/app/controller/store_manager/notification/update_noti_controller.dart';
import 'package:get/get.dart';

class UpdateNotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateNotificationController());
  }

}