import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class FilterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FilterController());
    Get.lazyPut(() => FilterAttrController());
    Get.lazyPut(() => FilterCategoriesController());
    Get.lazyPut(() => FilterDistrictController());
  }

}
class FilterController extends GetxController with GetSingleTickerProviderStateMixin{
  var display = "Danh sách".obs;
  var more_display = true.obs;
  late AnimationController expandDisplayController;
  late Animation<double> animationDisplay;
  var more_attr = true.obs;
  var more_categories = true.obs;
  var more_district = true.obs;
  var attr = "Mới nhất".obs;
  var categories_active = [].obs;
  var distints_active = [].obs;



  @override
  void onInit() {
    expandDisplayController  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    animationDisplay = CurvedAnimation(
      parent: expandDisplayController,
      curve: Curves.fastOutSlowIn,
    );
    expandDisplayController.forward();
  }


}
class FilterAttrController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandAttrController;
  late Animation<double> animationAttr;



  @override
  void onInit() {

    expandAttrController  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    animationAttr = CurvedAnimation(
      parent: expandAttrController,
      curve: Curves.fastOutSlowIn,
    );
    expandAttrController.forward();
  }
}

class FilterCategoriesController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandFilterCategoriesController;
  late Animation<double> animationCategories;



  @override
  void onInit() {

    expandFilterCategoriesController  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    animationCategories = CurvedAnimation(
      parent: expandFilterCategoriesController,
      curve: Curves.fastOutSlowIn,
    );
    expandFilterCategoriesController.forward();
  }
}
class FilterDistrictController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandDistrictController;
  late Animation<double> animationDistrict;



  @override
  void onInit() {
    expandDistrictController  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    animationDistrict = CurvedAnimation(
      parent: expandDistrictController,
      curve: Curves.fastOutSlowIn,
    );
    expandDistrictController.forward();
  }
}