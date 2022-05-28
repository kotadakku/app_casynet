
import 'package:app_casynet/app/controller/home/api/banner_controller.dart';
import 'package:app_casynet/app/controller/home/api/promotion_controller.dart';
import 'package:app_casynet/app/controller/home/api/recommend_controller.dart';
import 'package:app_casynet/app/controller/home/api/reservation_controller.dart';
import 'package:app_casynet/app/controller/home/api/seller_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  late String search_text = "";
  late bool _isVN = true;

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
}
