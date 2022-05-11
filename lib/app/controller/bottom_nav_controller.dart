
import 'package:app_casynet/app/data/service/notication_service.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController{
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    if(index == 1) Get.put(NotificationService()).updateSeenNotification();
  }
}