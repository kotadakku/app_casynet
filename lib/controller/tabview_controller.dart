import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class TabStoreController extends GetxController with GetSingleTickerProviderStateMixin  {

  final List<String> listTabStores = [
    "Giới thiệu", "Sản phẩm (200)", "Tin tức", "Đánh giá", "Hỏi đáp"
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTabStores.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class TabWalletVoucherController extends GetxController with GetSingleTickerProviderStateMixin  {

  final List<String> listTab = [
    "Có hiệu lực", "Đã sử dụng"
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTab.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}