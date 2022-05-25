
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../load_more_data/seller_loadmore_controller.dart';
import 'api/seller_controller.dart';

class StoresMoreController extends GetxController{
  var isCar = true.obs;

  // SellerController controller = Get.find();
  late ScrollController scrollController;
  int _curPageNumber = 1;
  int _pageSizeNumber = 12;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    // scrollController = ScrollController()..addListener((_loadMore));

    scrollController = ScrollController()..addListener(() {
      if(scrollController.position.extentAfter < 50 ){

        _loadMore();
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _loadMore() async{
    if(!isLoading){
      SellerLoadMoreController sellerController = Get.find();
      if(scrollController.position.maxScrollExtent == scrollController.offset){
        isLoading = true;
        _curPageNumber = ++_curPageNumber;
        _pageSizeNumber = _pageSizeNumber ;
        await sellerController.getSellersLoadMoreAPI(pageSize: _pageSizeNumber, curPage: _curPageNumber, type_filter: '');
        isLoading = false;
      }
    }
  }
}