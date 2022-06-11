import 'package:app_casynet/app/controller/store_manager/notification/notification_manager_controller.dart';
import 'package:get/get.dart';

class NotificationManagerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationManagerController(), fenix: true);
  }

}