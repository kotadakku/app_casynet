
import 'package:app_casynet/app/data/repo/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:app_casynet/app/data/data.dart';

class AccountCOntroller extends GetxController{
  final favouriteProductList = [].obs;
  final isLoadingFovourite = false.obs;
  final errorFavourite = ''.obs;
  final viewedProductList = [].obs;
  final isLoadingViewed = false.obs;
  final errorViewed = ''.obs;
  final followedProductList = [].obs;
  final isLoadingFollowed = false.obs;
  final errorFollowed = ''.obs;

  Future<void> getFavouriteProductApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingFovourite.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await UserRepo().getFavoutiteProduct(
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
          favouriteProductList.value = result.listObjects ?? []:
          favouriteProductList.addAll(result.listObjects ?? []);
          if(favouriteProductList.isEmpty){
            isLoadingFovourite.value = false;
            return;
          }
          isLoadingFovourite.value = false;
        }
        else{
          errorFavourite.value = result.msg.toString();
          isLoadingFovourite.value = false;
        }
      }

    } catch(error){
      print(error);
      errorFavourite.value = 'Hệ thống đang gặp vấn đề';
      isLoadingFovourite.value = false;
    }
  }

  Future<void> getViewedProductApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingFovourite.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await UserRepo().getViewedProduct(
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
          viewedProductList.value = result.listObjects ?? []:
          viewedProductList.addAll(result.listObjects ?? []);
          if(viewedProductList.isEmpty){
            isLoadingViewed.value = false;
            return;
          }
          isLoadingViewed.value = false;
        }
        else{
          errorViewed.value = result.msg.toString();
          isLoadingViewed.value = false;
        }
      }

    } catch(error){
      print(error);
      errorViewed.value = 'Hệ thống đang gặp vấn đề';
      isLoadingViewed.value = false;
    }
  }
  Future<void> getFollowedSellerApi({bool first_load = false, int pageSize = 20 ,int currentPage = 1 }) async {
    if(first_load) isLoadingFovourite.value = true;
    final tokenAdmin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try{
      final result = await UserRepo().getFollowedSeller(
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
          followedProductList.value = result.listObjects ?? []:
          followedProductList.addAll(result.listObjects ?? []);
          if(followedProductList.isEmpty){
            isLoadingFollowed.value = false;
            return;
          }
          isLoadingFollowed.value = false;
        }
        else{
          errorFollowed.value = result.msg.toString();
          isLoadingFollowed.value = false;
        }
      }

    } catch(error){
      print(error);
      errorFollowed.value = 'Hệ thống đang gặp vấn đề';
      isLoadingFollowed.value = false;
    }
  }
}