
import 'package:get/get.dart';

import '../../../controller/store_manager/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>DashboardController());
  }
}