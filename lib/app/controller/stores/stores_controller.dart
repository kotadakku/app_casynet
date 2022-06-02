import 'package:app_casynet/app/controller/filter/map_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/seller.dart';
import '../../data/repo/home_repo.dart';
import '../home/api/seller_controller.dart';

class StoresController extends GetxController {
  var isCar = true.obs;
  final sellerListLoadMore = <Seller>[].obs;
  late ScrollController scrollController;
  int _curPageNumber = 2;
  int _pageSizeNumber = 12;
  bool _isLoading = false;
  final isLoadingApi = false.obs;



  @override
  void onInit() {
    super.onInit();
    SellerController _sellerController = Get.find();
    sellerListLoadMore.addAll(_sellerController.sellerList);
    scrollController = ScrollController()..addListener((_loadMore));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _loadMore() async {
    if (!_isLoading) {
      if (scrollController.position.extentAfter < 500) {
        _isLoading = true;
        _curPageNumber = ++_curPageNumber;

        _pageSizeNumber = _pageSizeNumber;
        if (isCar.isTrue) {
          await getSellersAPI(
              pageSize: _pageSizeNumber,
              curPage: _curPageNumber,
              type_filter: '5');
        } else {
          await getSellersAPI(
              pageSize: _pageSizeNumber,
              curPage: _curPageNumber,
              type_filter: '6');
        }
        _isLoading = false;
      }
    }
  }
  Future<void> getSellersAPI({bool first_load = false, int pageSize = 12,int curPage= 1,  String? type_filter }) async {
    MapController mapController = Get.find();
    if(first_load) isLoadingApi.value = true;
    try {
      final result = await HomePageRepo().getSellers(
          queryParameters: {
            'lat': mapController.currentLocation.latitude,   /*21.0012507,*/  // lat user
            'lng': mapController.currentLocation.longitude,     /*105.7938183,*/ // long user
            'pageSize': pageSize,
            'curPage': curPage,
            'type_filter': type_filter
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          first_load ? sellerListLoadMore.value = result.listObjects ?? []:
          sellerListLoadMore.addAll(result.listObjects ?? []);
          isLoadingApi.value = false;

        } else {
          // Get.snackbar("Thông báo", resultLM.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          isLoadingApi.value = false;
        }
      }
    } catch (e) {
      // Get.snackbar("Thông báo", "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      isLoadingApi.value = false;
    }
  }
}
