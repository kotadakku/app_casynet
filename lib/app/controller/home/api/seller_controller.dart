
import 'package:app_casynet/app/data/model/seller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repo/home_repo.dart';


class SellerController extends GetxController with StateMixin{
  final _sellerList = <Seller>[].obs;

  @override
  void onInit() {
    getSellersAPI(pageSize: '12',cat: '');
  }


  Future<void> getSellersAPI({required String pageSize, required String cat }) async {
    change(_sellerList, status: RxStatus.loading());
    try {
      final result = await HomePageRepo().getSellers(
        queryParameters: {
          'pageSize': pageSize,
          'cat': cat,
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