
import 'dart:async';
import 'package:app_casynet/app/controller/home/fetch_banner_controller.dart';
import 'package:app_casynet/app/controller/home/fetch_topsales_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/banner_slider.dart';
import '../../data/model/sales.dart';
import '../../data/provider/banner_api_provider.dart';
import '../../data/provider/sales_api_provider.dart';
import '../../data/provider/sales_db_provider.dart';
import '../../data/provider/user_db_provider.dart';
import '../../utlis/base64.dart';

class HomeController extends GetxController{
  FetchTopSalesController _fetchTopSalesController = Get.put(FetchTopSalesController());
  FetchBannerController _fetchBannerController = Get.put(FetchBannerController());
  late String search_text = "";
  late bool _isVN = true;

  void onChangeSearchText( value){
    search_text = value;
    print(search_text);
  }

  bool get isVN => _isVN;

  void setIsVN() {
    _isVN = !isVN;
    update();
  }


  @override
  void onInit() {
  }


  @override
  void onReady() async  {
    _fetchTopSalesController.getSalesAPI();
    _fetchBannerController.getBannerAPI();
  }

  String languageToString() {
    if(_isVN) return 'VN';
    return 'EN';
  }

  void refreshAPI(){

  }
}
