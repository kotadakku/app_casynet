import 'package:get/get.dart';

import '../../utlis/service/notication_service.dart';

class BottombarController extends GetxController{

  var tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
    if(index == 1) Get.put(NotificationService()).updateSeenNotification();
  }
}