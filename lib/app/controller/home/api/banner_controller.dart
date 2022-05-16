import 'package:app_casynet/app/config/config_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/banner_slider.dart';
import '../../../data/provider/db/db_provider.dart';
import '../../../data/repo/home_repo.dart';
import '../../../utlis/base64.dart';

class FetchBannerController extends GetxController with StateMixin{
  final bannersList = <BannerSlider>[].obs;

  @override
  void onInit() {
    getBannerAPI();
  }
  void _getBannersDB(){
    change(bannersList, status: RxStatus.loading());
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_BANNER, DBConfig.BANNER_COLUMN_ID).then((value) {
      if(value?.length == 0){
        getBannerAPI();
      }else{
        value?.forEach((element) {
          bannersList.add(BannerSlider(
            id: element[DBConfig.BANNER_COLUMN_ID],
            image: element[DBConfig.BANNER_COLUMN_IMAGE],
          ));
        });
      }
    });
    change(bannersList, status: RxStatus.success());
  }
  Future<void> getBannerAPI() async {
    change(bannersList, status: RxStatus.loading());
    try {
      final result = await  HomePageRepo().getBanners();
      if (result != null) {
        if (result.isSuccess) {
          bannersList.value = result.listObjects ?? [];
          if(bannersList.isEmpty){
            change(bannersList, status: RxStatus.empty());
            return;
          }
          change(bannersList, status: RxStatus.success());
          DatabaseHelper.instance.clear(DBConfig.TABLE_CATEGORY);
          for( var banner in  bannersList){
            DatabaseHelper.instance.insert(
                DBConfig.TABLE_BANNER,
                BannerSlider(id: banner.id,image: banner.image).toJson());
          }
        } else {
          print(result.msg.toString());
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          change(bannersList, status: RxStatus.error());
        }
      }
    } catch (e) {
      // Get.snackbar("Thông báo", "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(bannersList, status: RxStatus.error());
    }
  }
}