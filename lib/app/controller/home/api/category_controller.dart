
import 'package:app_casynet/app/config/config_db.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/category.dart';
import '../../../data/provider/db_provider.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/home_repo.dart';


class CategoryController extends GetxController{


  final categoriesList = <Category>[].obs;
  final isLoadingAPI = false.obs;
  final isLoadingDB = false.obs;

  @override
  void onInit() {
    _getCategoryDB();
    getCategoriesAPI();

  }

  void _getCategoryDB() {

    isLoadingDB.value = true;
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_CATEGORY, DBConfig.CATEGORY_COLUMN_ID).then((value) {
      if(value?.length == 0){
        isLoadingDB.value = false;
        getCategoriesAPI();
      }else{
        print('<Load Category> Load DB');
        value?.forEach((element) {
          categoriesList.add(Category(
            id: element[DBConfig.CATEGORY_COLUMN_ID],
            imageUrl: element[DBConfig.CATEGORY_COLUMN_IMAGE],
            name: element[DBConfig.CATEGORY_COLUMN_TITLE]
          ));

        });
        isLoadingDB.value = false;
      }
    });
  }
  Future<void> getCategoriesAPI() async {
    isLoadingAPI.value = true;
    final token_admin = await GetStorageProvider().get(key: CacheManagerKey.TOKEN_ADMIN.toString());
    try {
      final result = await  HomePageRepo().getCategories(
        options: Options(
            headers: {'Authorization': 'Bearer $token_admin'}
        ),
        queryParameters: {
          'searchCriteria[filterGroups][0][filters][0][field]': 'level',
          'searchCriteria[filterGroups][0][filters][0][value]': '3',
          'searchCriteriafilterGroups[filters][0][condition_type]': 'eq',
        }
      );
      if (result != null) {
        if (result.isSuccess) {
          categoriesList.value = result.listObjects ?? [];
          isLoadingAPI.value = false;
          DatabaseHelper.instance.clear(DBConfig.TABLE_CATEGORY);
          for( var category in  categoriesList){
            DatabaseHelper.instance.insert(DBConfig.TABLE_CATEGORY,
                Category(
                  id: category.id,
                  imageUrl: category.imageUrl,
                  name: category.name
                ).toJson()
            );
          }
        } else {
          // scaffoldMessenger.showSnackBar(
          //   SnackBar(content: Text(result.msg.toString()), duration: Duration(seconds: 1)),
          // );
          isLoadingAPI.value = false;
        }
      }
    } catch (e) {
      // scaffoldMessenger.showSnackBar(
      //   SnackBar(content: Text(e.toString()), duration: Duration(seconds: 1)),
      // );
      isLoadingAPI.value = false;
    }

  }
}