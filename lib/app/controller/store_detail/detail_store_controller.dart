import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';
import '../../data/model/seller.dart';
import '../../data/provider/get_storage_provider.dart';
import '../../data/repo/seller_repo.dart';

class DetailStoreController extends GetxController with GetSingleTickerProviderStateMixin  {

  final List<String> listTabs = [
    "Giới thiệu", "Sản phẩm (200)", "Tin tức", "Đánh giá", "Hỏi đáp"
  ];
  final productSellerList = <Product>[].obs;
  RxInt vote_selected = 5.obs;
  late TabController controller;
  var isLoading = true.obs;
  final isLoadingProduct = true.obs;
  RxBool isLive = true.obs;
  RxBool followed = true.obs;
  final store = Seller().obs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTabs.length);
    getParameter();
    getProductSellerAPI(sellerId: 634);
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

  Future<void> getProductSellerAPI({required int sellerId }) async {
    isLoadingProduct.value = true;
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try {
      final result = await HomePageRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $token_admin'}
          ),
          queryParameters: {
            'searchCriteria[pageSize]': '12',
            'searchCriteria[currentPage]': '1',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
            'searchCriteria[filterGroups][0][filters][0][field]': 'seller_id',
            'searchCriteria[filterGroups][0][filters][0][value]': '$sellerId',
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          productSellerList.value = result.listObjects ?? [];
          isLoadingProduct.value = false;

        } else {
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          isLoadingProduct.value = false;
        }
      }
    } catch (e) {
      Get.snackbar("Thông báo", "error:: $e",
          backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      isLoadingProduct.value = false;
    }
  }
}
