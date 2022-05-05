import 'package:get/get.dart';

import '../../data/model/banner_slider.dart';
import '../../data/provider/banner_api_provider.dart';
import '../../data/provider/user_db_provider.dart';
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
    BannerDatabaseHelper.instance.queryAllRows().then((value) {
      if(value?.length == 0){
        getBannerAPI();
      }else{
        print("<Home Controller> Load from db");
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

  void getBannerAPI(){
    isLoading = true;

    print("<Home Controller> Load from api $isLoading");
    BannerProvider().getBanners(onSuccess: (banners){
      listBanners.clear();
      BannerDatabaseHelper.instance.clear();

      banners.forEach((banner){
        ImageNetworkToBase64(url: banner.image).getHttp().then((base64) {
          BannerDatabaseHelper.instance.insert(BannerSlider(image: base64));
          listBanners.add(BannerSlider(image: base64));
        });
      });
      isLoading = false;
      print("<Home COntroller>  Success $isLoading");
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