
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/seller.dart';
import '../../data/repo/home_repo.dart';

class SellerLoadMoreController extends GetxController with StateMixin{
  var sellerListLoadMore = <Seller>[].obs;
  late int pageNumber =1;
  late int pageSizeNumber =12;


  @override
  void onInit() {
    getSellersLoadMoreAPI(pageSize: pageSizeNumber, curPage: pageNumber, type_filter: 'null');
  }

  Future<void> getSellersLoadMoreAPI({bool first_load = false, required int pageSize, required int curPage,required String type_filter }) async {


    if(first_load) change(sellerListLoadMore, status: RxStatus.loading());
    try {
      final resultLM = await HomePageRepo().getSellersLoadMore(
          queryParameters: {
            'lat': 21.0012507,  // lat user
            'lng': 105.7938183, // long user
            'pageSize': pageSize,
            'curPage': curPage,
            'type_filter': type_filter
          }
      );
      if (resultLM != null) {
        if (resultLM.isSuccess) {
          first_load ? sellerListLoadMore.value = resultLM.listObjects ?? []: sellerListLoadMore.value.addAll(resultLM.listObjects ?? []);
          if(sellerListLoadMore.isEmpty){
            change(sellerListLoadMore, status: RxStatus.empty());
            return;
          }
          change(sellerListLoadMore, status: RxStatus.success());

        } else {
          Get.snackbar("Thông báo", resultLM.msg.toString(),
              backgroundColor: Colors.black.withOpacity(0.3));
          print(resultLM.msg.toString());
          change(sellerListLoadMore, status: RxStatus.empty());
        }
      }
    } catch (e) {
      Get.snackbar("Thông báo", "error:: $e",
          backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(sellerListLoadMore, status: RxStatus.empty());
    }
  }
}