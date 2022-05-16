
import 'package:app_casynet/app/config/config_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/category.dart';
import '../../data/provider/db/db_provider.dart';
import '../../data/repo/home_repo.dart';


class CategoryHomeController extends GetxController with StateMixin{
  final _categoriesList = <Category>[].obs;

  @override
  void onInit() {
    _getCategoryDB();
    getCategoriesAPI();
  }

  void _getCategoryDB() {
    change(_categoriesList, status: RxStatus.loading());
    print('<Load Category> Load DB');
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_CATEGORY, DBConfig.CATEGORY_COLUMN_ID).then((value) {
      if(value?.length == 0){
        getCategoriesAPI();
      }else{
        value?.forEach((element) {
          _categoriesList.add(Category(
            id: element[DBConfig.CATEGORY_COLUMN_ID],
            imageUrl: element[DBConfig.CATEGORY_COLUMN_IMAGE],
            name: element[DBConfig.CATEGORY_COLUMN_TITLE]
          ));

        });
      }
    });
    change(_categoriesList, status: RxStatus.success());
  }
  Future<void> getCategoriesAPI() async {
    change(_categoriesList, status: RxStatus.loading());
    try {
      final result = await  HomePageRepo().getCategories();
      if (result != null) {
        if (result.isSuccess) {
          _categoriesList.value = result.listObjects ?? [];
          if(_categoriesList.isEmpty){
            change(_categoriesList, status: RxStatus.empty());
            return;
          }
          change(_categoriesList, status: RxStatus.success());
          DatabaseHelper.instance.clear(DBConfig.TABLE_CATEGORY);
          for( var category in  _categoriesList){
            DatabaseHelper.instance.insert(DBConfig.TABLE_CATEGORY,
                Category(
                  id: category.id,
                  imageUrl: category.imageUrl,
                  name: category.name
                ).toJson()
            );
          }
        } else {
          Get.snackbar("Thông báo", result.msg.toString(),
            backgroundColor: Colors.black.withOpacity(0.3));
          change(_categoriesList, status: RxStatus.error());
        }
      }
    } catch (e) {
      Get.snackbar("Thông báo", "error:: $e",
        backgroundColor: Colors.black.withOpacity(0.3));
      change(_categoriesList, status: RxStatus.error());
    }

  }
}