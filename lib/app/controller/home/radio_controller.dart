import 'package:get/get.dart';

class RadioController extends GetxController{
  var isCarStore = true.obs;
  var isCarPromotion = true.obs;
  var isCarReservation = true.obs;
  var isCarRecommend = true.obs;


  void updateIsCarStore() {
    isCarStore.value = !isCarStore.value;
  }

  void updateIsCarReservation() {
    isCarReservation.value = !isCarReservation.value;

  }

  void updateIsCarPromotion() {
    isCarPromotion.value = !isCarPromotion.value;
  }

  void updateIsCarRecommend() {
    isCarRecommend.value = !isCarRecommend.value;
  }
}