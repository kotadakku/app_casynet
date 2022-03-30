import 'package:get/get.dart';

class DetailProductBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => BannerProductController());
  }
}

class BannerProductController extends GetxController{
  var current = 0.obs;
}