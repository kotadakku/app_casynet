import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';
import '../../data/repo/product_repo.dart';

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
  TextEditingController date_controller = TextEditingController();
  TextEditingController hours_controller = TextEditingController();
  TextEditingController note_controller = TextEditingController();
  FocusNode hours_focus = FocusNode();
  FocusNode date_focus = FocusNode();

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
}