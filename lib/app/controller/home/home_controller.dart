
import 'package:app_casynet/app/controller/home/api/promotion_controller.dart';
import 'package:app_casynet/app/controller/home/api/recommend_controller.dart';
import 'package:app_casynet/app/controller/home/api/reservation_controller.dart';
import 'package:app_casynet/app/controller/home/api/seller_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utlis/service/notication_service.dart';

class HomeController extends GetxController{
  late String search_text = "";
  late bool _isVN = true;
  var tabIndex = 0.obs;
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
  void changeTabIndex(int index) {
    tabIndex.value = index;
    if(index == 1) Get.put(NotificationService()).updateSeenNotification();
  }

  void onChangeSearchText( value){
    search_text = value;
    print(search_text);
  }

  bool get isVN => _isVN;

  void setIsVN() {
    _isVN = !isVN;
    update();
  }


  @override
  void onInit() {
  }

  String languageToString() {
    if(_isVN) return 'VN';
    return 'EN';
  }

  Future<void> refreshAPI() async {
    SellerController sellerController = Get.find();
    ReservationController reservationController = Get.find();
    PromotionController promotionController = Get.find();
    RecommendController recommendController = Get.find();
    sellerController.getSellersAPI(pageSize: 12, curPage: 1);
    reservationController.getReservationProductsAPI();
    promotionController.getPromotionProductsAPI();
    recommendController.getRecommendProductsAPI();
  }

  void callPhone(String s) {
    launch("tel:$s");
  }

}
