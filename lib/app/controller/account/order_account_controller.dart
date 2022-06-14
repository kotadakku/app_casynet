import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/order_controller.dart';

class OrderAccountController extends GetxController with GetSingleTickerProviderStateMixin{
  final List<String> listTabs = [
    'all', 'purchased', 'cancelled'
  ];
  late TabController controller;
  final isLoadingAll = false.obs;
  final isLoadingCancel = false.obs;
  final isLoadingComplete = false.obs;
  int _page = 1;
  int _pageCancel = 1;
  int _pageComplete = 1;

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
  void loadMoreAll() async {
    OrderController orderController = Get.find();
    if(!isLoadingAll.value){
      isLoadingAll.value = true;
      _page += 1;
      await orderController.getOrdersAllApi(currentPage: _page, pageSize: 20);
      isLoadingAll.value = false;
    }
  }
  void loadMoreCancel() async {

    OrderController orderController = Get.find();
    if(!isLoadingCancel.value){
      isLoadingCancel.value = true;
      _pageCancel += 1;
      await orderController.getOrdersCanceledApi(currentPage: _pageCancel, pageSize: 20);
      isLoadingCancel.value = false;
    }
  }
  void loadMoreComplete() async {
    OrderController orderController = Get.find();
    if(!isLoadingComplete.value){
      isLoadingComplete.value = true;
      _pageComplete += 1;
      await orderController.getOrdersCompleteApi(currentPage: _pageComplete, pageSize: 20);
      isLoadingComplete.value = false;
    }
  }
}