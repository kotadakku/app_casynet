import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderAccountController extends GetxController with GetSingleTickerProviderStateMixin{
  final List<String> listTabs = [
    "Tất cả", "Đặt mua", "Đã hủy"
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