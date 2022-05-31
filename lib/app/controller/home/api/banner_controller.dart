import 'package:app_casynet/app/data/model/banner_slider.dart';
import 'package:get/get.dart';

import '../../../config/config_db.dart';
import '../../../data/provider/db_provider.dart';
import '../../../data/repo/home_repo.dart';

class FetchBannerController extends GetxController{
  // final bannersList = <BannerSlider>[].obs;
  final bannerSliderList = <BannerSlider>[].obs;
  final isLoadingAPI = false.obs;
  final isLoadingDB = false.obs;
  final error = "".obs;

  @override
  void onInit() {
    _getBannerDB();
    getBannerAPI();
  }
  Future<void> getBannerAPI() async {
    isLoadingAPI.value = true;
    error.value = "";
    try {
      final result = await  HomePageRepo().getBannerSlider();
      if (result != null) {
        if (result.isSuccess) {
          // bannersList.value = result.listObjects ?? [];
          bannerSliderList.value = result.listObjects ?? [];
          isLoadingAPI.value = false;
          if(bannerSliderList.length <=0){
            error.value = "Không có cửa hàng nào để hiển thị";
            return;
          }
          DatabaseHelper.instance.clear(DBConfig.TABLE_BANNER);
          for( var banner in  bannerSliderList){
            DatabaseHelper.instance.insert(DBConfig.TABLE_BANNER,
                banner.toJson()
            );
          }

        } else {
          print(result.msg.toString());
          error.value = "${result.msg.toString()}";
          isLoadingAPI.value = false;
        }
      }
    } catch (e) {
      print(e);
      error.value = "Hệ thống đang có vấn đề!!";
      isLoadingAPI.value = false;
    }
  }

  void _getBannerDB() {
    isLoadingDB.value = true;
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_BANNER, DBConfig.BANNER_COLUMN_ID).then((value){
      if(value?.length ==0){
        isLoadingDB.value = false;
        getBannerAPI();
      }
      else{
        print('<Load SELLER> Load DB');
        value?.forEach((element) {
          bannerSliderList.add(
              BannerSlider(
                id: element[DBConfig.BANNER_COLUMN_ID],
                htmlTag: element[DBConfig.BANNER_COLUMN_IMAGE],
              )
          );
        });
        isLoadingDB.value = false;
      }
    });
  }
}