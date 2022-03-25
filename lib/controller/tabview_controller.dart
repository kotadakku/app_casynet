import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class MyTabController extends GetxController with GetSingleTickerProviderStateMixin  {
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