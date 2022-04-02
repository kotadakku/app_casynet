import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailStoreController extends GetxController with GetSingleTickerProviderStateMixin  {
  final List<String> listTabs = [
    "Giới thiệu", "Sản phẩm (200)", "Tin tức", "Đánh giá", "Hỏi đáp"
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
