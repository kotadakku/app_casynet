import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';
import '../../data/model/seller.dart';
import '../../data/provider/get_storage_provider.dart';
import '../../data/repo/product_repo.dart';
import '../../data/repo/seller_repo.dart';
import '../../data/repo/user_repo.dart';

class DetailStoreController extends GetxController with GetTickerProviderStateMixin {

  var isLoadingRateCmtAPI = false.obs;
  var errorRateCmt = "".obs;
  final rateCmtList = <Rate>[].obs;

  var isReadMore = false.obs;
  final isCarReservation = false.obs;
  final isFeatured = false.obs;
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
  RxBool followed = false.obs;
  final errorGetProduct = ''.obs;
  final errorgetFeatures = ''.obs;
  final store = Seller().obs;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: listTabs.length);
    getParameter();
    checkUserLike();
    getProductSellerAPI(category_id: 5);
    getProductFeaturedSellerAPI(category_id: 5);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  getParameter() {
    if (Get.arguments['store'] != null) {
      store.value = Get.arguments['store'];
      getDetailSellerAPI();
    }
  }

  Future<void> getDetailSellerAPI(
      {String seller_url = '98-vo-chi-cong'}) async {
    isLoading.value = true;
    try {
      final result = await SellerRepo().getSeller(seller_url);
      if (result != null) {
        if (result.isSuccess) {
          store.value = result.objects ?? Seller();
          isLoading.value = false;
        } else {
          print(result.msg.toString());
          isLoading.value = false;
        }
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  // đặt chỗ
  Future<void> getProductSellerAPI({required int category_id,}) async {
    isLoadingProduct.value = true;
    final tokenAdmin = await GetStorageProvider().get(
        key: CacheManagerKey.TOKEN_ADMIN.toString());
    isLoadingProduct.value = false;
    try {
      final result = await ProductRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $tokenAdmin'}
          ),
          queryParameters: {
            'searchCriteria[pageSize]': '12',
            'searchCriteria[currentPage]': '1',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
            'searchCriteria[filterGroups][0][filters][0][field]': 'seller_id',
            'searchCriteria[filterGroups][0][filters][0][value]': '${store.value
                .id}',
            'searchCriteria[filterGroups][2][filters][0][field]': 'category_id',
            'searchCriteria[filterGroups][2][filters][0][value]': '$category_id',
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          productSellerList.value = result.listObjects ?? [];
          isLoadingProduct.value = false;
          // isLoadingProduct.value = false;
        } else {
          print(result.msg.toString());
          isLoadingProduct.value = false;
          errorGetProduct.value = result.msg.toString();
          // isLoadingProduct.value = false;
        }
      }
    } catch (e) {
      print(e);
      errorgetFeatures.value = 'Hệ thống đang gặp vấn đề';
      isLoadingProduct.value = false;
      // isLoadingProduct.value = false;
    }
  }

// nổi bật
  Future<void> getProductFeaturedSellerAPI({
    required int category_id,
  }) async {
    isLoadingFeatured.value = true;
    final tokenAdmin = await GetStorageProvider().get(
        key: CacheManagerKey.TOKEN_ADMIN.toString());
    try {
      final result = await ProductRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $tokenAdmin'}
          ),
          queryParameters: {
            'searchCriteria[pageSize]': '12',
            'searchCriteria[currentPage]': '1',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
            'searchCriteria[filterGroups][0][filters][0][field]': 'seller_id',
            'searchCriteria[filterGroups][0][filters][0][value]': '${store.value
                .id}',
            'searchCriteria[filterGroups][2][filters][0][field]': 'category_id',
            'searchCriteria[filterGroups][2][filters][0][value]': '$category_id',
            'searchCriteria[filterGroups][1][filters][0][field]': 'is_product_featured',
            'searchCriteria[filterGroups][1][filters][0][value]': 'true',
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          productFeaturedSellerList.value = result.listObjects ?? [];
          if (productFeaturedSellerList.isEmpty) {
            isLoadingFeatured.value = false;
            return;
          }
          isLoadingFeatured.value = false;
          // isLoadingProduct.value = false;
        } else {
          print(result.msg.toString());
          isLoadingFeatured.value = false;
          errorgetFeatures.value = result.msg.toString();
          // isLoadingProduct.value = false;
        }
      }
    } catch (e) {
      print(e);
      errorgetFeatures.value = 'Hệ thống đang gặp vấn đề';
      isLoadingFeatured.value = false;
    }
  }
  void updateIsCarReservation() {
    isFeatured.value = !isFeatured.value;
    getProductSellerAPI(category_id: 5);
    getProductFeaturedSellerAPI(category_id: 5);


  }
  Future<void> checkUserLike() async {
    try {
      final result = await UserRepo().isFollowSeller(
      );
      if (result.statusCode == CODE_SUCCESS) {
        followed.value = result.objects ?? false;
      }
    }
    catch (error) {

    }
  }
  void followSeller() async {
    followed.value = followed.value;
    try{
      final result = await UserRepo().followSeller();
    }
    catch(error){

    }
  }

  void addVoucher(int idVoucher) async {

    try{
      final result = await UserRepo().addVoucher(
          id: idVoucher
      );
    }
    catch(error){

    }
  }

  // đánh giá bình luận
  Future<void> getRateCommentAPI() async{
    isLoadingRateCmtAPI.value = true;
    errorRateCmt.value = "";
    try{
      final result = await RateCommentRepo().getRateComent();

      if(result != null){
        if(result.isSuccess){
          rateCmtList.value = result.listObjects ?? [];
          isLoadingRateCmtAPI.value = false;
          if(rateCmtList.length <= 0){
            errorRateCmt.value = "Không có đánh giá bình luận nào";
            return;
          }
        }else{
          isLoadingRateCmtAPI.value = false;
          errorRateCmt.value = "${result.msg.toString()}";
          print(result.msg.toString());
        }

      }
    }catch (e){
      print(e);
      errorRateCmt.value = "Hệ thống đang có vẫn đề!";
      isLoadingRateCmtAPI.value = false;

    }
  }
}

