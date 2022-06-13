
import 'package:app_casynet/app/controller/store_manager/news/news_manager_controller.dart';
import 'package:get/get.dart';

class NewsManagerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => NewsManagerCotroller(), fenix: true);
  }

}