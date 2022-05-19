import 'package:app_casynet/app/data/model/order.dart';
import 'package:app_casynet/app/data/provider/get_storage_provider.dart';
import 'package:app_casynet/app/data/repo/account_repo.dart';
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin{
  final _orderList = <Order>[].obs;

  @override
  void onInit() {
    getOrdersApi(first_load: true);
  }

  Future<void> getOrdersApi({bool first_load = false, String status = 'pending', int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) change(_orderList, status: RxStatus.loading());
    final tokenAdmin = GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await AccountRepo().getOrders(
        queryParameters: {
          'searchCriteria[filterGroups][0][filters][0][field]': 'status',
          'searchCriteria[filterGroups][0][filters][0][value]': status,
          'searchCriteria[filterGroups][0][filters][0][conditionType]': 'eq',
          'searchCriteria[pageSize]': '$pageSize',
          'searchCriteria[currentPage]': '$currentPage'
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenAdmin',
          }
      )
        // queryParameters:  {
        //   'searchCriteria[filterGroups][0][filters][0][field]': 'customer_id',
        //   'searchCriteria[filterGroups][0][filters][0][value]': '6518',
        //   'searchCriteria[filterGroups][0][filters][0][conditionType]': 'eq'
        // }
      );
      if(result != null){
        if(result.isSuccess){
          first_load ? _orderList.value = result.listObjects ?? []: _orderList.value.addAll(result.listObjects ?? []);
          if(_orderList.isEmpty){
            change(_orderList, status: RxStatus.empty());
            return;
          }
          change(_orderList, status: RxStatus.success());
        }
        else{
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          printError(info: result.msg.toString());
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