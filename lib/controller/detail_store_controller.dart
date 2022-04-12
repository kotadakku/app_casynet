import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailStoreController extends GetxController with GetSingleTickerProviderStateMixin  {
  final List<String> listTabs = [
    "Giới thiệu", "Sản phẩm (200)", "Tin tức", "Đánh giá", "Hỏi đáp"
  ];
  RxInt vote_selected = 5.obs;
  RxBool followed = true.obs;
  late TabController controller;
  RxBool isLive = true.obs;

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
