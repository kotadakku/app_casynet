import 'dart:async';
import 'dart:convert';

import 'package:app_casynet/data/provider/banner_api_provider.dart';
import 'package:app_casynet/data/provider/user_db_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/model/banner_slider.dart';
import '../data/model/sales.dart';
import '../data/provider/sales_api_provider.dart';
import '../utlis/base64.dart';

class HomeController extends GetxController{
  var current_banner = 0.obs;
  var isCar = true.obs;
  var listBanners = [];
  List<Sales> listSales = [];
  var isLoading = true;
  var isLoadingSales = true;
  late Timer _timer;
  late String search_text = "";
  late bool _isVN = true;

  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void onInit() {
      _getData();
      _getSales();
  }


  @override
  void onReady() {
    _autoPageView();
  }

  void _autoPageView(){
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (current_banner.value < listBanners.length-1) {
        current_banner.value++;
      } else {
        current_banner.value = 0;
      }

      pageController.animateToPage(
        current_banner.value,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn,
      );
    });
  }
  void swippingPageView(details){
    if (details.velocity.pixelsPerSecond.dx > 0) {
      if(current_banner.value < listBanners.length -1)
        current_banner.value++;
      else current_banner.value = 0;
      pageController.animateToPage(
        current_banner.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }

    // Swiping in left direction.
    if (details.velocity.pixelsPerSecond.dx < 0) {
      if(current_banner.value > 0)
        current_banner.value--;
      else current_banner.value = listBanners.length -1;
      pageController.animateToPage(
        current_banner.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  void _getData() {
    BannerDatabaseHelper.instance.queryAllRows().then((value) {
      if(value?.length == 0){
        print("Load from api");
        BannerProvider().getBanners(onSuccess: (banners){
          addData(banners);
        },
        beforeSend: (){},
          onError: (error){
            print("Error " + error.toString());
            isLoading = false;
            update();
          }
        );

      }else{
        print("Load from db");
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

  void addData(List<BannerSlider> banners) async {
    await Future.wait(banners.map((e){
      return ImageNetworkToBase64(url: e.image).getHttp().then((base64) {
        BannerDatabaseHelper.instance.insert(
          BannerSlider(image: base64)).then((value){
            listBanners.add(BannerSlider(image: base64));
            isLoading = false;
            update();
        });
      });
    }));
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
