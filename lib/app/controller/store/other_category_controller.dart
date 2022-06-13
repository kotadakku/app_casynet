
import 'package:app_casynet/app/controller/store/create_seller_controller.dart';
import 'package:app_casynet/app/data/model/category.dart';
import 'package:get/get.dart';

import '../home/api/category_controller.dart';

class OtherCategoryController extends GetxController{


  // final isSave = true.obs;


  var chonDanhmuc = "- Chọn -".obs;
  var chooseMainCategory = "- Chọn -".obs;


  final listOtherCategory =  <Category>[].obs;// mảng tạm chứa danh mục nghề khác
  var isChange = false.obs;

  var checkOtherCategory = false.obs;

  @override
  void onInit() {
    // if(Get.arguments[0] != null){
    //   listOtherCategory.addAll(Get.arguments[0]);
    // }
  }

  bool isCategorySelected(Category? category){
    return listOtherCategory.contains(category);
  }

  void onChangeCheckbox(Category? category){
    if(isCategorySelected(category)){
      listOtherCategory.remove(category);
      isChange.value = true;
    }
    else{
      listOtherCategory.add(category!);
      isChange.value = true;
    }
  }
}