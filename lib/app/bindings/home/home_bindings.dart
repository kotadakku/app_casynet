import 'package:app_casynet/app/controller/home/search_controller.dart';
import 'package:get/get.dart';

import '../../controller/home/banner_page_view_controller.dart';
import '../../controller/product_detail/detail_app_controller.dart';


class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchController());
    Get.lazyPut(() => DetailAppController(), fenix: true );
    Get.lazyPut(() => BannerController());
  }
}