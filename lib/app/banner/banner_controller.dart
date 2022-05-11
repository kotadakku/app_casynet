import 'package:app_casynet/app/banner/banner_model.dart';
import 'package:app_casynet/app/banner/banner_provider.dart';
import 'package:app_casynet/app/data/provider/banner_api_provider.dart';
import 'package:app_casynet/app/utlis/base64.dart';
import 'package:get/get.dart';

class BannerControllerTest extends GetxController {
  var listBannerTest = [];

  var _isLoadingTest = true;

  @override
  void onInit() {
    _getBannerDBTest();
  }

  void _getBannerDBTest() {
    _isLoadingTest = true;
    BannerDatabaseHelper.instance.getAll().then((value) {
      if (value?.length == 0) {
        getBannerAPITest();
      } else {
        value?.forEach((element) {
          listBannerTest
              .add(BannerTest(id: element['id'], image: element['image']));
          _isLoadingTest = false;
          update();
        });
      }
    });
  }

  Future<void> getBannerAPITest() async {
    _isLoadingTest = true;
    listBannerTest.clear();
    BannerDatabaseHelper.instance.deleteTable();
    BannerProvider().getBanners(onSuccess: (banners) async {
      for (var banner in banners) {
        var base64 = await ImageNetworkToBase64(url: banner.image).getHttp();
        BannerDatabaseHelper.instance.insert();
      }
    });
  }
}
