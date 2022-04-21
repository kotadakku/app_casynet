import 'package:app_casynet/data/provider/cuahang_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../data/model/cuahang.dart';
import '../data/model/datcho.dart';
import '../model/Sanpham.dart';

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

  late CuaHang store;

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
    store = Get.arguments['store'];
    isLoading = false;
  }
  fetchCuaHang(id) {
    CuaHangProvider().fetchCuaHang(id: int.parse(id), onSuccess: (CuaHang data){
      store = data;
      print(store.time_open);
      isLoading= false;
      update();
    },
    onError: (error){
      print(error);
    }
    );
  }
  fetchProductsStore(id){
    CuaHangProvider().fetchProductsStore(id: int.parse(id),
      onSuccess: (data){
        products.addAll(data);
        update();
      },
    onError: (error){
      print(error);
    }
    );
  }
  @override
  void onReady() {
    super.onReady();
    fetchCuaHang(store.idcuahang);
    fetchProductsStore(store.idcuahang);
  }
}
