import 'package:app_casynet/app/controller/home/api/promotion_controller.dart';
import 'package:app_casynet/app/controller/home/api/recommend_controller.dart';
import 'package:app_casynet/app/controller/home/api/seller_controller.dart';
import 'package:app_casynet/app/controller/filter/map_controller.dart';
import 'package:get/get.dart';
import '../../controller/account/auth/authentication_manager.dart';
import '../../controller/cart/api/product_cart_controller.dart';
import '../../controller/home/api/origin_controller.dart';
import '../../controller/home/api/region_controller.dart';
import '../../controller/home/appbar_controller.dart';
import '../../controller/home/bottombar_controller.dart';
import '../../controller/product_detail/detail_app_controller.dart';
import '../../controller/home/api/banner_controller.dart';
import '../../controller/home/api/category_controller.dart';
import '../../controller/home/api/reservation_controller.dart';
import '../../controller/home/api/top_sale_controller.dart';
import '../../controller/home/banner_page_view_controller.dart';
import '../../controller/home/home_controller.dart';
import '../../utlis/service/notication_service.dart';


class MainBindings extends Bindings {
  @override
  void dependencies() {

    Get.put(HomeController());
    Get.put(BottombarController());

    Get.put(RegionController());
    Get.put(OriginController());
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
    Get.put(MapController());
    Get.put(NotificationService());



  }
}