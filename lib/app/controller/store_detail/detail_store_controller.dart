import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';
import '../../data/model/seller.dart';
import '../../data/provider/get_storage_provider.dart';
import '../../data/repo/product_repo.dart';
import '../../data/repo/seller_repo.dart';

class DetailStoreController extends GetxController with GetSingleTickerProviderStateMixin, StateMixin  {

  final List<String> listTabs = [
    'introduce'.tr, "${'product'.tr} (200)", 'news'.tr, 'rate'.tr, 'qa'.tr
  ];
  final productSellerList = <Product>[].obs;
  final productFeaturedSellerList = <Product>[].obs;
  RxInt vote_selected = 5.obs;
  late TabController controller;
  var isLoading = true.obs;
  final isLoadingProduct = true.obs;
  final isLoadingFeatured = true.obs;
  RxBool isLive = true.obs;
  RxBool followed = true.obs;
  final store = Seller().obs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTabs.length);
    getParameter();
    getProductSellerAPI(sellerId: 630,category_id: 5,);
    getProductFeaturedSellerAPI(sellerId: 630, category_id: 5, is_product_featured_number: 1);
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
          // Get.snackbar('noti'.tr, result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          isLoading.value = false;
        }
      }
    } catch (e) {
      Get.snackbar('noti'.tr, "error:: $e",
          backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      isLoading.value = false;
    }
  }

  // đặt chỗ
  Future<void> getProductSellerAPI({required int sellerId, required int category_id,})
  async {
    isLoadingProduct.value = true;
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    change(productSellerList, status: RxStatus.loading());
    try {
      final result = await ProductRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $token_admin'}
          ),
          queryParameters: {
            'searchCriteria[pageSize]': '12',
            'searchCriteria[currentPage]': '1',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
            'searchCriteria[filterGroups][0][filters][0][field]': 'seller_id',
            'searchCriteria[filterGroups][0][filters][0][value]': '$sellerId',
            'searchCriteria[filterGroups][2][filters][0][field]': 'category_id',
            'searchCriteria[filterGroups][2][filters][0][value]': '$category_id',
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          productSellerList.value = result.listObjects ?? [];
          if(productSellerList.isEmpty){
            change(productSellerList,status: RxStatus.empty());
            return;
          }
          change(productSellerList,status: RxStatus.success());
          // isLoadingProduct.value = false;
        } else {
          Get.snackbar('noti'.tr, result.msg.toString(),
              backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          change(productSellerList,status: RxStatus.empty());
          // isLoadingProduct.value = false;
        }
      }
    } catch (e) {
      Get.snackbar('noti'.tr, "error:: $e",
          backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(productSellerList,status: RxStatus.empty());
      // isLoadingProduct.value = false;
    }
  }

// nổi bật
  Future<void> getProductFeaturedSellerAPI({
    required int sellerId,
    required int category_id,
    required int is_product_featured_number
  })
  async {
    isLoadingFeatured.value = true;
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    change(productFeaturedSellerList, status: RxStatus.loading());
    try {
      final result = await ProductRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $token_admin'}
          ),
          queryParameters: {
            'searchCriteria[pageSize]': '12',
            'searchCriteria[currentPage]': '1',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
            'searchCriteria[filterGroups][0][filters][0][field]': 'seller_id',
            'searchCriteria[filterGroups][0][filters][0][value]': '$sellerId',
            'searchCriteria[filterGroups][2][filters][0][field]': 'category_id',
            'searchCriteria[filterGroups][2][filters][0][value]': '$category_id',
            'searchCriteria[filterGroups][1][filters][0][field]': 'is_product_featured',
            'searchCriteria[filterGroups][1][filters][0][value]': '$is_product_featured_number',
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          productFeaturedSellerList.value = result.listObjects ?? [];
          if(productFeaturedSellerList.isEmpty){
            change(productFeaturedSellerList,status: RxStatus.empty());
            return;
          }
          change(productFeaturedSellerList,status: RxStatus.success());
          // isLoadingProduct.value = false;
        } else {
          Get.snackbar('noti'.tr, result.msg.toString(),
              backgroundColor: Colors.black.withOpacity(0.3));
          print(result.msg.toString());
          change(productFeaturedSellerList,status: RxStatus.empty());
          // isLoadingProduct.value = false;
        }
      }
    } catch (e) {
      Get.snackbar('noti'.tr, "error:: $e",
          backgroundColor: Colors.black.withOpacity(0.3));
      print(e);
      change(productFeaturedSellerList,status: RxStatus.empty());
      // isLoadingProduct.value = false;
    }
  }

}
