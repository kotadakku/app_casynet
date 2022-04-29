
import 'package:app_casynet/app/data/provider/category_home_provider.dart';
import 'package:get/get.dart';

import '../../data/model/category_home.dart';

class CategoryHomeController extends GetxController{
  List<CategoryHome> categoryHomeList = [];
  var isCategoryHome = true;
  var loadingCategoryHome =true;

  @override
  void onInit() {
    updateAPI();
  }

  void updateAPI(){
    categoryHomeList.clear();
    loadingCategoryHome = true;

    CategoryHomeProvider().fetchCategoryHomeList( onSuccess: (data){
      categoryHomeList.addAll(data);
      loadingCategoryHome = false;
      update();
    },onError: (error){
      loadingCategoryHome = false;
      print(error);
      update();
    });
  }
}