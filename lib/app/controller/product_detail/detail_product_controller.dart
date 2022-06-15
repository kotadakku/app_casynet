import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/repo/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data.dart';
import '../../data/model/product.dart';
import '../../data/provider/get_storage_provider.dart';
import '../../data/repo/product_repo.dart';
import 'package:app_casynet/app/data/data.dart';

class DetailProductController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;
  var current = 0.obs;
  var more_image = false.obs;
  final product = Product().obs;
  var isLoading = true.obs;
  RxBool isLive = true.obs;
  RxBool followed = true.obs;
  var date = "".obs;
  final isLike = false.obs;
  TextEditingController date_controller = TextEditingController();
  TextEditingController hours_controller = TextEditingController();
  TextEditingController note_controller = TextEditingController();
  FocusNode hours_focus = FocusNode();
  FocusNode date_focus = FocusNode();

  final isLoadingFeatured = false.obs;

  final productFeaturedList = [].obs;

  final errorgetFeatures = ''.obs;

  final rateCmtList = <Rate>[].obs;
  var rateMe = Rate().obs;
  final isLoadingRateCmtAPI = false.obs;

  @override
  void onInit() {
    controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 400),

    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    getParameter();
    checkUserFollow();
    checkUserLike();
    getProductFeatureAPI(category_id: 12);
    getRateCommentAPI();
  }
  void checkUserLike() async {
    try{
      final result = await UserRepo().ckeckUserLike();
      if(result.statusCode == CODE_SUCCESS){
        isLike.value = result.objects ?? false;
      }
    } catch (error){

    }

  }
  void likeProduct() async {
    isLike.value = !isLike.value;
    try{
      final result = await UserRepo().likeProduct();
      if(result.statusCode == CODE_SUCCESS){
        isLike.value = result.objects ?? false;
      }
    } catch (error){

    }

  }
  getParameter(){
    if(Get.arguments['product'] !=null){
      product.value = Get.arguments['product'];
      final sku = product.value.sku;
      if(sku != null){
        getDetailProductAPI(sku: sku);
      }

    }
  }


  Future<void> getDetailProductAPI({String sku = '1S7G8575AM'}) async {
    isLoading.value = true;
    try {
      final result = await ProductRepo().getProduct(sku: sku);
      if (result != null) {
        if (result.isSuccess) {
          product.value = result.objects ?? Product();
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
      // Get.snackbar('noti'.tr, "error:: $e",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      isLoading.value = false;
    }
  }
  Future<void> checkUserFollow() async {
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
  Future<void> getProductFeatureAPI({required int category_id,}) async {
    isLoadingFeatured.value = true;
    final tokenAdmin = await GetStorageProvider().get(
        key: CacheManagerKey.TOKEN_ADMIN.toString());
    isLoadingFeatured.value = false;
    try {
      final result = await ProductRepo().getProducts(
          options: Options(
              headers: {'Authorization': 'Bearer $tokenAdmin'}
          ),
          queryParameters: {
            'searchCriteria[pageSize]': '12',
            'searchCriteria[currentPage]': '1',
            'searchCriteria[sortOrders][0][direction]': 'DESC',
            'searchCriteria[filterGroups][2][filters][0][field]': 'category_id',
            'searchCriteria[filterGroups][2][filters][0][value]': '$category_id',
          }
      );
      if (result != null) {
        if (result.isSuccess) {
          productFeaturedList.value = result.listObjects ?? [];
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
      // isLoadingProduct.value = false;
    }
  }
  Future<void> getRateCommentAPI() async{
    isLoadingRateCmtAPI.value = true;

    rateNotMes.forEach((e) {
      rateCmtList.add(Rate.fromJson(e));
    });

    rateMe.value = Rate.fromJson(rate_me);

    isLoadingRateCmtAPI.value = false;

    // errorRateCmt.value = "";
    // try{
    //   final result = await RateCommentRepo().getRateComent();
    //
    //   if(result != null){
    //     if(result.isSuccess){
    //       rateCmtList.value = result.listObjects ?? [];
    //       isLoadingRateCmtAPI.value = false;
    //       if(rateCmtList.length <= 0){
    //         errorRateCmt.value = "Không có đánh giá bình luận nào";
    //         return;
    //       }
    //     }else{
    //       isLoadingRateCmtAPI.value = false;
    //       errorRateCmt.value = "${result.msg.toString()}";
    //       print(result.msg.toString());
    //     }
    //
    //   }
    // }catch (e){
    //   print(e);
    //   errorRateCmt.value = "Hệ thống đang có vẫn đề!";
    //   isLoadingRateCmtAPI.value = false;
    //
    // }
  }

}