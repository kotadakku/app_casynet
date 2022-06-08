
import 'package:app_casynet/app/controller/store_manager/product/add_product_controller.dart';
import 'package:get/get.dart';

import '../../../data/model/category.dart';

class SelectCategoryController extends GetxController{
  final listCategorySelected = <Category>[].obs;
  final isChange = false.obs;



  @override
  void onInit() {
    AddProductController _productController = Get.find();
    listCategorySelected.addAll(_productController.listCategorySelected);
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