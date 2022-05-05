import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
    BannerDatabaseHelper.instance.clear();
    BannerProvider().getBanners(onSuccess: (banners) async {
      for (var banner in banners) {
        var base64 = await ImageNetworkToBase64(url: banner.image).getHttp();
        BannerDatabaseHelper.instance.insert(BannerSlider(image: base64));
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