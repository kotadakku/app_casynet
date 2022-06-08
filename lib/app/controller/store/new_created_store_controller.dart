
import 'package:app_casynet/app/data/model/category.dart';
import 'package:get/get.dart';

import '../home/api/category_controller.dart';

class NewCreatedStoreController extends GetxController{

  var chonDanhmuc = "- Chọn -".obs;
  var chooseMainCategory = "- Chọn -".obs;


  RxList listOtherCategory = [].obs; // mảng tạm chứa danh mục
  var checkOtherCategory = false.obs;


  // var chooseMainCategory = {Category()}.obs;
  // void toggle(Category item){
  //   chooseMainCategory[item] = !(chooseMainCategory[item] ?? true);
  //   update();
  // }
  // get selectedCategories => chooseMainCategory.entries.where((element) => element.value).map((e) => e.key).toList();
  //
  // get categories => chooseMainCategory.entries.map((e) => e.key).toList();
}