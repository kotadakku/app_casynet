import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class BannerController extends GetxController{
  var current_banner = 0.obs;
  late Timer _timer;
  PageController pageController = PageController(
    initialPage: 0,
  );
  HomeController _homeController = Get.find();

  @override
  void onReady() {
    _autoPageView();
  }

  void _autoPageView(){
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (current_banner.value < _homeController.listBanners.length-1) {
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
      if(current_banner.value < _homeController.listBanners.length -1)
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
      else current_banner.value = _homeController.listBanners.length -1;
      pageController.animateToPage(
        current_banner.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }


}