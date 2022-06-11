
import 'package:app_casynet/app/controller/store/create_seller_controller.dart';
import 'package:app_casynet/app/data/model/category.dart';
import 'package:get/get.dart';

import '../home/api/category_controller.dart';

class OtherCategoryController extends GetxController{

  var isChange = false.obs;
  final isSave = true.obs;


  var chonDanhmuc = "- Chọn -".obs;
  var chooseMainCategory = "- Chọn -".obs;


  final listOtherCategory =  <Category>[].obs;

  final newlistOtherCategory =  <Category>[].obs;// mảng tạm chứa danh mục nghề khác


  var checkOtherCategory = false.obs;

  @override
  void onInit() {
    CreateSellerController _creSellerController = Get.find();
    for(var i = 0; i < _creSellerController.listOtherCateSelected.length; i++){
      print("List danh mục khác ${_creSellerController.listOtherCateSelected[i].name}");
      print("List danh mục khác ${_creSellerController.listOtherCateSelected[i].name}");
    }
    listOtherCategory.remove(true);
    // listOtherCategory.addAll(_creSellerController.listOtherCateSelected);
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