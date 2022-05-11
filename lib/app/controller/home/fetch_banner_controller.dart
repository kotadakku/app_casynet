import 'package:app_casynet/app/data/provider/db/config_db.dart';
import 'package:get/get.dart';

import '../../data/model/banner_slider.dart';
import '../../data/provider/banner_api_provider.dart';
import '../../data/provider/db/db_provider.dart';
import '../../utlis/base64.dart';

class FetchBannerController extends GetxController{
  var listBanners = [];

  var isLoading = true;

  @override
  void onInit() {
    _getBannerDB();
  }

  void _getBannerDB() {
    isLoading = true;
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_BANNER, DBConfig.COLUMN_BANNER_ID).then((value) {
      if(value?.length == 0){
        getBannerAPI();
      }else{
        value?.forEach((element) {
          listBanners.add(BannerSlider(
            id: element['id'],
            image: element['image'],
          ));
          isLoading = false;
          update();
        });
      }
    });
  }

  Future<void> getBannerAPI() async {
    isLoading = true;
    listBanners.clear();
    DatabaseHelper.instance.clear(DBConfig.TABLE_BANNER);
    BannerProvider().getBanners(onSuccess: (banners) async {
      for (var banner in banners) {
        var base64 = await ImageNetworkToBase64(url: banner.image).getHttp();
        DatabaseHelper.instance.insert(DBConfig.TABLE_BANNER, BannerSlider(image: base64).toJson());
        listBanners.add(BannerSlider(image: base64));

        update();
      }
      isLoading = false;
      update();
      },
        beforeSend: (){},
        onError: (error){
          print("Error " + error.toString());
          isLoading = false;
          update();
        }
    );
  }
}