import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/banner_slider.dart';
import '../../data/model/sales.dart';
import '../../data/provider/banner_api_provider.dart';
import '../../data/provider/sales_api_provider.dart';
import '../../data/provider/user_db_provider.dart';
import '../../utlis/base64.dart';

class HomeController extends GetxController{

  var listBanners = [];
  List<Sales> listSales = [];
  var isLoading = true;
  var isLoadingSales = true;

  late String search_text = "";
  late bool _isVN = true;



  @override
  void onInit() {
    _getBannerDB();
    _getSales();
    _getBannerAPI();

  }


  @override
  void onReady(){
    super.onReady();
  }

  void _getBannerDB() {
    BannerDatabaseHelper.instance.queryAllRows().then((value) {
      if(value?.length == 0){
        print("<Home Controller> Load from api");
        _getBannerAPI();
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

  void _getBannerAPI(){
    print("<Home Controller> Load from api");
    BannerProvider().getBanners(onSuccess: (banners){
      listBanners.clear();
      BannerDatabaseHelper.instance.clear();

      banners.forEach((banner){
        ImageNetworkToBase64(url: banner.image).getHttp().then((base64) {
          BannerDatabaseHelper.instance.insert(BannerSlider(image: base64));
          listBanners.add(BannerSlider(image: base64));
          isLoading = false;
          print(listBanners.length);
        });
      });
    },
    beforeSend: (){},
    onError: (error){
      print("Error " + error.toString());
      isLoading = false;
      update();
    }
    );
  }

  void _getSales(){
    SalesProvider().getSales(onSuccess: (sales){
      listSales.addAll(sales);
      isLoadingSales = false;
      update();
    },
    onError: (error){
      print(error);
      update();
    }
    );
  }

  void onChangeSearchText( value){
    search_text = value;
    print(search_text);
  }

  bool get isVN => _isVN;

  void setIsVN() {
    _isVN = !isVN;
    update();
  }

  String languageToString() {
    if(_isVN) return 'VN';
    return 'EN';
  }
}
