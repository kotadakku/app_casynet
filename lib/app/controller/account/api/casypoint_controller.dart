import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:app_casynet/app/data/data.dart';

class CasypointController extends GetxController{
  final casypointAllList = [].obs;
  final isLoadingAll = false.obs;
  final errorAll = ''.obs;
  final casypointUsedList = [].obs;
  final isLoadingUsed = false.obs;
  final errorUsed = ''.obs;
  final casypointNewList = [].obs;
  final isLoadingNew = false.obs;
  final errorNew = ''.obs;


  Future<void> getCasypointAllApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingAll.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await CasypointRepo().getCasypoints(
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
          casypointAllList.value = result.listObjects ?? []:
          casypointAllList.addAll(result.listObjects ?? []);
          if(casypointAllList.isEmpty){
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

  Future<void> getCasypointUsedApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingUsed.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await CasypointRepo().getCasypoints(
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
          casypointUsedList.value = result.listObjects ?? []:
          casypointUsedList.addAll(result.listObjects ?? []);
          if(casypointUsedList.isEmpty){
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
  Future<void> getCasypointNewApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingUsed.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await CasypointRepo().getCasypoints(
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
          casypointNewList.value = result.listObjects ?? []:
          casypointNewList.addAll(result.listObjects ?? []);
          if(casypointNewList.isEmpty){
            isLoadingNew.value = false;
            return;
          }
          isLoadingNew.value = false;
        }
        else{
          errorNew.value = result.msg.toString();
          isLoadingNew.value = false;
        }
      }

    } catch(error){
      print(error);
      errorNew.value = 'Hệ thống đang gặp vấn đề';
      isLoadingNew.value = false;
    }
  }
}