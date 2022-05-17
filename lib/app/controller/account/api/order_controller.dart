import 'package:app_casynet/app/data/model/order.dart';
import 'package:app_casynet/app/data/repo/account_repo.dart';
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin{
  final _orderList = <Order>[].obs;

  @override
  void onInit() {
    getOrdersApi();
  }

  Future<void> getOrdersApi() async {
    change(_orderList, status: RxStatus.loading());
    try{
      final result = await AccountRepo().getOrders(
        queryParameters:  {
          'searchCriteria[filterGroups][0][filters][0][field]': 'customer_id',
          'searchCriteria[filterGroups][0][filters][0][value]': '6518',
          'searchCriteria[filterGroups][0][filters][0][conditionType]': 'eq'
        }
      );
      if(result != null){
        if(result.isSuccess){
          _orderList.value = result.listObjects ?? [];
          if(_orderList.isEmpty){
            change(_orderList, status: RxStatus.empty());
            return;
          }
          change(_orderList, status: RxStatus.success());
        }
        else{
          Get.snackbar("Thông báo", result.msg.toString(),
              backgroundColor: Colors.black.withOpacity(0.3));
          change(_orderList, status: RxStatus.error());
        }
      }

    } catch(error){
      Get.snackbar("Thông báo", "error:: $error",
          backgroundColor: Colors.black.withOpacity(0.3));
      change(_orderList, status: RxStatus.error());
    }
  }
}