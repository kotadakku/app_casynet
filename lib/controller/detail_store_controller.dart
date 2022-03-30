import 'package:app_casynet/controller/radio_car_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailStoreBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => MyTabController());
  }
}

class MyTabController extends GetxController with GetSingleTickerProviderStateMixin  {
  final List<String> listTabs = [
    "Tất cả", "Đặt mua", "Đã hủy"
  ];
  final List<String> listTabStores = [
    "Giới thiệu", "Sản phẩm (200)", "Tin tức", "Hỏi đáp"
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
