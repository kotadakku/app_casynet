import 'package:app_casynet/data/provider/banner_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  var current_banner = 0.obs;
  var isCar = true.obs;
  var listBanners = [];

  @override
  void onInit() {
      BannerProvider().getBanners(onSuccess: (data){
        print(data);
        listBanners.addAll(data);
        update();
      },
      onError: (error){
        print(error);
      });
  }
}
