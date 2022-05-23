import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/seller.dart';
import '../../data/repo/seller_repo.dart';

class DetailStoreController extends GetxController with GetSingleTickerProviderStateMixin, StateMixin  {

  final List<String> listTabs = [
    "Giới thiệu", "Sản phẩm (200)", "Tin tức", "Đánh giá", "Hỏi đáp"
  ];
  RxInt vote_selected = 5.obs;
  late TabController controller;
  var isLoading = true.obs;
  RxBool isLive = true.obs;
  RxBool followed = true.obs;

  final store = Seller().obs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTabs.length);
    getParameter();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
  getParameter(){
    if(Get.arguments['store'] !=null){
      store.value = Get.arguments['store'];
      getDetailSellerAPI();
    }
  }

  Future<void> getDetailSellerAPI({String seller_url = '98-vo-chi-cong'}) async {
    isLoading.value = true;
    try {
      final result = await SellerRepo().getSeller(seller_url);
      if (result != null) {
        if (result.isSuccess) {
          store.value = result.objects ?? Seller();
          // if(_sellerDetail){
          //   change(_sellerDetail, status: RxStatus.empty());
          //   return;
          // }
          isLoading.value = false;

        } else {
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          isLoading.value = false;
        }
      }
    } catch (e) {
      Get.snackbar("Thông báo", "error:: $e",
          backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      isLoading.value = false;
    }
  }
}
