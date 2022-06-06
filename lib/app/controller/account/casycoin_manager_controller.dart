import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CasycoinManagerController extends GetxController with GetSingleTickerProviderStateMixin{
  RxInt sizeCoin = 0.obs;
  RxList listTab = [].obs;

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    listTab.value = [
      "${'all_history'.tr} (${sizeCoin.value})", 'received'.tr, 'used'.tr
    ];
    controller = TabController(vsync: this, length: listTab.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}