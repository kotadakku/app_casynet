
import 'package:app_casynet/app/data/model/seller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repo/home_repo.dart';


class SellerController extends GetxController with StateMixin{
  final _sellerList = <Seller>[].obs;

  late int pageNumber =1;
  late int pageSizeNumber =12;
  late int type_filter_number;

  @override
  void onInit() {
    getSellersAPI(first_load: true,pageSize: 12,curPage: 1, type_filter: 'null');
  }


  Future<void> getSellersAPI({bool first_load = false, required int pageSize, required int curPage,required String type_filter }) async {
    if(first_load) change(_sellerList, status: RxStatus.loading());
    try {
      final result = await HomePageRepo().getSellers(
        queryParameters: {
          'lat': 21.0012507,  // lat user
          'lng': 105.7938183, // long user
          'pageSize': pageSize,
          'curPage': curPage,
          'type_filter': type_filter
        }
      );
      if (result != null) {
        if (result.isSuccess) {
          _sellerList.value = result.listObjects ?? [];
          if(_sellerList.isEmpty){
            change(_sellerList, status: RxStatus.empty());
            return;
          }
          change(_sellerList, status: RxStatus.success());

        } else {
          Get.snackbar("Thông báo", result.msg.toString(),
              backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          change(_sellerList, status: RxStatus.empty());
        }
      }
    } catch (e) {
      Get.snackbar("Thông báo", "error:: $e",
          backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(_sellerList, status: RxStatus.empty());
    }
  }



}