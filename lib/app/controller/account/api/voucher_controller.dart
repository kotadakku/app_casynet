
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:app_casynet/app/data/data.dart';

class VoucherController extends GetxController {
  final voucherAllList = [].obs;
  final isLoadingAll = false.obs;
  final errorAll = ''.obs;
  final voucherUsedList = [].obs;
  final isLoadingUsed = false.obs;
  final errorUsed = ''.obs;

  Future<void> getVoucherAllApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingAll.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await VoucherRepo().getVouchers(
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
          voucherAllList.value = result.listObjects ?? []:
          voucherAllList.addAll(result.listObjects ?? []);
          if(voucherAllList.isEmpty){
            isLoadingAll.value = false;
            return;
          }
          isLoadingAll.value = false;
        }
        else{
          errorAll.value = result.msg.toString();
          isLoadingAll.value = false;
        }
      }

    } catch(error){
      print(error);
      errorAll.value = 'Hệ thống đang gặp vấn đề';
      isLoadingAll.value = false;
    }
  }

  Future<void> getVoucherUsedApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingUsed.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await VoucherRepo().getVouchers(
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
          voucherUsedList.value = result.listObjects ?? []:
          voucherUsedList.addAll(result.listObjects ?? []);
          if(voucherUsedList.isEmpty){
            isLoadingUsed.value = false;
            return;
          }
          isLoadingUsed.value = false;
        }
        else{
          errorUsed.value = result.msg.toString();
          isLoadingUsed.value = false;
        }
      }

    } catch(error){
      print(error);
      errorUsed.value = 'Hệ thống đang gặp vấn đề';
      isLoadingUsed.value = false;
    }
  }
}