import 'package:app_casynet/app/data/model/order.dart';
import 'package:app_casynet/app/data/provider/get_storage_provider.dart';
import 'package:app_casynet/app/data/repo/account_repo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class OrderController extends GetxController with StateMixin{
  final _orderList = <Order>[].obs;
  final orderCanceledList = <Order>[].obs;
  final orderCompleteList = <Order>[].obs;
  final isLoadingCancel = true.obs;
  final isLoadingAll = false.obs;
  final isLoadingComplete = true.obs;

  @override
  void onInit() {
    getOrdersAllApi(first_load: true);
    getOrdersCanceledApi(first_load: true);
    getOrdersCompleteApi(first_load: true);
  }

  Future<void> getOrdersAllApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) change(_orderList, status: RxStatus.loading());
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await AccountRepo().getOrders(
        queryParameters: {
          'searchCriteria[pageSize]': '$pageSize',
          'searchCriteria[currentPage]': '$currentPage'
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $tokenAdmin',
          }
      )
      );
      if(result != null){
        if(result.isSuccess){
          first_load ? _orderList.value = result.listObjects ?? [] : _orderList.value.addAll(result.listObjects ?? []);
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
      // Get.snackbar("Thông báo", "error:: $error",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      change(_orderList, status: RxStatus.error());
    }
  }

  Future<void> getOrdersCanceledApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingCancel.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await AccountRepo().getOrders(
          queryParameters: {
            'searchCriteria[filterGroups][0][filters][0][field]': 'status',
            'searchCriteria[filterGroups][0][filters][0][value]': 'canceled',
            'searchCriteria[filterGroups][0][filters][0][conditionType]': 'eq',
            'searchCriteria[pageSize]': '$pageSize',
            'searchCriteria[currentPage]': '$currentPage'
          },
          options: Options(
              headers: {
                'Authorization': 'Bearer $tokenAdmin',
              }
          )
      );
      if(result != null){
        if(result.isSuccess){
          first_load ?
          orderCanceledList.value = result.listObjects ?? []:
          orderCanceledList.addAll(result.listObjects ?? []);
          if(orderCanceledList.isEmpty){
           isLoadingCancel.value = false;
            return;
          }
          isLoadingCancel.value = false;
        }
        else{
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          printError(info: result.msg.toString());
          isLoadingCancel.value = false;
        }
      }

    } catch(error){
      // Get.snackbar("Thông báo", "error:: $error",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      print(error);
      isLoadingCancel.value = false;
      change(orderCanceledList, status: RxStatus.error());
    }
  }

  Future<void> getOrdersCompleteApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingComplete.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await AccountRepo().getOrders(
          queryParameters: {
            'searchCriteria[filterGroups][0][filters][0][field]': 'status',
            'searchCriteria[filterGroups][0][filters][0][value]': 'complete',
            'searchCriteria[filterGroups][0][filters][0][conditionType]': 'eq',
            'searchCriteria[pageSize]': '$pageSize',
            'searchCriteria[currentPage]': '$currentPage'
          },
          options: Options(
              headers: {
                'Authorization': 'Bearer $tokenAdmin',
              }
          )
      );
      if(result != null){
        if(result.isSuccess){
          first_load ? orderCompleteList.value = result.listObjects ?? []: orderCompleteList.addAll(result.listObjects ?? []);
          if(orderCompleteList.isEmpty){
            isLoadingComplete.value = false;
            return;
          }
          isLoadingComplete.value = false;
        }
        else{
          // Get.snackbar("Thông báo", result.msg.toString(),
          //     backgroundColor: Colors.black.withOpacity(0.3));
          printError(info: result.msg.toString());
          isLoadingComplete.value = false;
        }
      }

    } catch(error){
      // Get.snackbar("Thông báo", "error:: $error",
      //     backgroundColor: Colors.black.withOpacity(0.3));
      change(orderCompleteList, status: RxStatus.error());
    }
  }
}