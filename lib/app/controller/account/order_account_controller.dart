import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/order_controller.dart';

class OrderAccountController extends GetxController with GetSingleTickerProviderStateMixin{
  final List<String> listTabs = [
    "Tất cả", "Đặt mua", "Đã hủy"
  ];
  late TabController controller;
  late ScrollController scrollController;
  int _page = 1;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTabs.length);
    scrollController = ScrollController()..addListener(_loadMore);
  }


  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
  void _loadMore() async {
    if(!isLoading){
      OrderController orderController = Get.find();
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        isLoading = true;
        _page += 1;
        await orderController.getOrdersApi(status: 'pending', currentPage: _page, pageSize: 20);
        isLoading = false;
      }
    }
  }
}