import 'package:app_casynet/app/controller/bottom_nav_controller.dart';
import 'package:app_casynet/app/controller/home/api/promotion_controller.dart';
import 'package:app_casynet/app/controller/home/api/recommend_controller.dart';
import 'package:app_casynet/app/controller/home/api/seller_controller.dart';
import 'package:get/get.dart';
import '../controller/account/new_address_controller.dart';
import '../controller/auth/authentication_manager.dart';
import '../controller/cart/api/product_cart_controller.dart';
import '../controller/detail_app_controller.dart';
import '../controller/home/api/banner_controller.dart';
import '../controller/home/api/category_controller.dart';
import '../controller/home/api/reservation_controller.dart';
import '../controller/home/api/top_sale_controller.dart';
import '../controller/home/banner_page_view_controller.dart';
import '../controller/home/home_controller.dart';
import '../utlis/service/notication_service.dart';


class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());

    Get.put(HomeController());
    Get.lazyPut(() => BannerController());
    Get.lazyPut(() => DetailAppController(), fenix: true );
    Get.put(NewAddressController());
    // Get.put(ConnectivityService());
    Get.put(DetailAppController());
    Get.put(ProductCartController());
    Get.put(CategoryController());
    Get.put(SellerController());
    Get.put(ReservationController());
    Get.put(PromotionController());
    Get.put(RecommendController());
    Get.put(TopSaleController());
    Get.put(AuthenticationManager());
    Get.put(FetchBannerController());
    Get.put(NotificationService());


  }
}