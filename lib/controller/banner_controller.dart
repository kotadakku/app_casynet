import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BannerController extends GetxController{
  var count = 0.obs;
  newCurrent(value) => count.value = value;
}