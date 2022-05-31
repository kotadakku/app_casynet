import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../load_more_data/seller_loadmore_controller.dart';

class StoresMoreController extends GetxController {
  var isCar = true.obs;

  // SellerController controller = Get.find();
  late ScrollController scrollController;
  int _curPageNumber = 2;
  int _pageSizeNumber = 12;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    // scrollController = ScrollController()..addListener((_loadMore));

    scrollController = ScrollController()..addListener((_loadMore));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _loadMore() async {
    if (!isLoading) {
      SellerLoadMoreController sellerController = Get.find();
      if (scrollController.position.extentAfter < 20000) {
        isLoading = true;
        _curPageNumber = ++_curPageNumber;

        _pageSizeNumber = _pageSizeNumber;
        if (isCar == true) {

          await sellerController.getSellersLoadMoreAPI(
              pageSize: _pageSizeNumber,
              curPage: _curPageNumber,
              type_filter: '5');
        } else {
          await sellerController.getSellersLoadMoreAPI(
              pageSize: _pageSizeNumber,
              curPage: _curPageNumber,
              type_filter: '6');
        }
        isLoading = false;
      }
    }
  }
}
