import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../data/model/cuahang.dart';
import '../../data/model/datcho.dart';

class DetailStoreController extends GetxController with GetSingleTickerProviderStateMixin  {

  final List<String> listTabs = [
    "Giới thiệu", "Sản phẩm (200)", "Tin tức", "Đánh giá", "Hỏi đáp"
  ];
  RxInt vote_selected = 5.obs;
  RxBool followed = true.obs;
  late TabController controller;
  RxBool isLive = true.obs;
  var isLoading = true;
  late List<DatCho> products = [];

  late CuaHang store = CuaHang();

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
    if(Get.arguments['store'] !=null) store = Get.arguments['store'];
    isLoading = false;
  }

  @override
  void onReady() {
    super.onReady();
  }
}
