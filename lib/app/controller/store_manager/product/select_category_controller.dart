
import 'package:app_casynet/app/controller/store_manager/product/add_product_controller.dart';
import 'package:get/get.dart';

import '../../../data/model/category.dart';

class SelectCategoryController extends GetxController{
  final listCategorySelected = <Category>[].obs; // mảng tạm
  final isChange = false.obs;



  @override
  void onInit() {
    if(Get.arguments[0] != null){
      listCategorySelected.addAll(Get.arguments[0]);
    }
  }

  bool isCategorySelected(Category? category){
    return listCategorySelected.contains(category);
  }

  void onChangeCheckbox(Category? category){
    if(isCategorySelected(category)){
      listCategorySelected.remove(category);
      isChange.value = true;
    }
    else{
      listCategorySelected.add(category!);
      isChange.value = true;
    }
  }
}