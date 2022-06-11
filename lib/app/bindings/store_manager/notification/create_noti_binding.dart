import 'package:app_casynet/app/controller/store_manager/notification/create_noti_controller.dart';
import 'package:get/get.dart';

class CreateNotificationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNotificationController(), fenix: true);
  }
}