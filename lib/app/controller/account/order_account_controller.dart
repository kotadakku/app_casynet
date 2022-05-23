import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api/order_controller.dart';

class OrderAccountController extends GetxController with GetSingleTickerProviderStateMixin{
  final List<String> listTabs = [
    "Tất cả", "Đặt mua", "Đã hủy"
  ];
  late TabController controller;
  late ScrollController scrollController;
  late ScrollController scrollCancelController;
  late ScrollController scrollCompleteController;
  bool isLoadingAll = false;
  bool isLoadingCancel = false;
  bool isLoadingComplete = false;
  int _page = 1;
  int _pageCancel = 1;
  int _pageComplete = 1;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTabs.length);
    scrollController = ScrollController()..addListener(_loadMoreAll);
    scrollCancelController = ScrollController()..addListener(_loadMoreCancel);
    scrollCompleteController = ScrollController()..addListener(_loadMoreComplete);
  }


  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
  void _loadMoreAll() async {

    OrderController orderController = Get.find();
    if(scrollController.position.maxScrollExtent == scrollController.offset){

      if(!isLoadingAll){
        isLoadingAll = true;
        _page += 1;
        await orderController.getOrdersAllApi(currentPage: _page, pageSize: 20);
        isLoadingAll = false;
      }
    }
  }
  void _loadMoreCancel() async {

    OrderController orderController = Get.find();
    if(scrollCancelController.position.maxScrollExtent == scrollCancelController.offset){
      if(!isLoadingCancel){
        isLoadingCancel = true;
        _pageCancel += 1;
        await orderController.getOrdersCanceledApi(currentPage: _pageCancel, pageSize: 20);
        isLoadingCancel = false;
      }
    }
  }
  void _loadMoreComplete() async {
    OrderController orderController = Get.find();
    if(scrollCompleteController.position.maxScrollExtent == scrollCompleteController.offset){
      if(!isLoadingComplete){
        isLoadingComplete = true;
        _pageComplete += 1;
        await orderController.getOrdersCompleteApi(currentPage: _pageComplete, pageSize: 20);
        isLoadingComplete = false;
      }
    }
  }
}