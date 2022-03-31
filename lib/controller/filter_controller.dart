import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

class FilterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FilterDisplayController());
    Get.lazyPut(() => FilterAttrController());
    Get.lazyPut(() => FilterCategoriesController());
    Get.lazyPut(() => FilterDistrictController());
    Get.lazyPut(() => FilterPriceController());
    Get.lazyPut(() => FilterOriginController());
  }

}
class FilterDisplayController extends GetxController with GetSingleTickerProviderStateMixin{
  var display = "Danh sách".obs;
  var more_display = true.obs;
  late AnimationController expandDisplayController;
  late Animation<double> animationDisplay;

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
  void expand(){
    if(more_display.value){
      expandDisplayController.reverse();
      more_display.value = !more_display.value;
    }
    else{
      expandDisplayController.forward();
      more_display.value = !more_display.value;
    }
  }
  void clear(){
    display.value = "Danh sách";
  }


}
class FilterAttrController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandAttrController;
  late Animation<double> animationAttr;
  var more_attr = true.obs;
  var attr = "Mới nhất".obs;
  void expand(){
    if(more_attr.value){
      expandAttrController.reverse();
      more_attr.value = !more_attr.value;
    }
    else{
      expandAttrController.forward();
      more_attr.value = !more_attr.value;
    }
  }
  void clear(){
    attr.value = "Mới nhất";
  }



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
  var more_categories = true.obs;
  var categories_active = [].obs;

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
  void expand(){
    if(more_categories.value){
      expandFilterCategoriesController.reverse();
      more_categories.value = !more_categories.value;
    }
    else{
      expandFilterCategoriesController.forward();
      more_categories.value = !more_categories.value;
    }
  }
  bool isContains(e){
    if(categories_active.contains(e)){
      return true;
    }
    return false;
  }
  void clear(){
    categories_active.clear();
  }
  void change_list(e){
    isContains(e) ? categories_active.remove(e) : categories_active.add(e);
  }
}
class FilterDistrictController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandDistrictController;
  late Animation<double> animationDistrict;
  var more_district = true.obs;
  var distints_active = [].obs;



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
  void expand(){
    if(more_district.value){
      more_district.value = !more_district.value;
     expandDistrictController.reverse();
    }
    else{
      more_district.value = !more_district.value;
      expandDistrictController.forward();
    }
  }
  bool isContain(e) {
    if(distints_active.contains(e)) {
      return true;
    }
    return false;
  }
  void change_list(e){
    isContain(e) ? distints_active.remove(e) : distints_active.add(e);
  }

  void clear() {
    distints_active.clear();
  }
}

class FilterPriceController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandPriceController;
  late Animation<double> animationPrice;
  var more_price = true.obs;
  var price_min = 0.obs;
  var is_high_price = false.obs;
  var price_max = 99999999.obs;
  late TextEditingController price_min_text;
  late TextEditingController price_max_text;
  var  price_max_error = "".obs;
  var price_min_error = "".obs;

  @override
  void onInit() {
    price_min_text = TextEditingController();
    price_max_text = TextEditingController();
    expandPriceController  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    animationPrice = CurvedAnimation(
      parent: expandPriceController,
      curve: Curves.fastOutSlowIn,
    );
    expandPriceController.forward();
  }

  void expand(){
    if(more_price.value){
      more_price.value = !more_price.value;
      expandPriceController.forward();
    } else{
      more_price.value = !more_price.value;
      expandPriceController.reverse();
    }
  }
  void clear(){
    price_min.value = 0;
    price_max.value = 999999999;
    is_high_price.value = false;
    price_max_text.text = "";
    price_min_text.text = "";
  }
  void validate_max(value){
    final number = int.tryParse(value);
    if(value == null || value.isEmpty){
      price_max_error.value = "Không được trống";
    }
    else if(number == null){
      price_max_error.value = "Vui lòng nhập số";
    }
    else{
      price_min.value = int.parse(value);
      price_max_error.value = "";
    }
  }
  void validate_min(value){
    final number = int.tryParse(value);
    if(value == null || value.isEmpty){
      price_min_error.value = "Không được trống";
    }
    else if(number == null){
      price_min_error.value = "Vui lòng nhập số";
    }
    else{
      price_min.value = int.parse(value);
      price_min_error.value = "";
    }
  }
}
class FilterOriginController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandOriginController;
  late Animation<double> animationOrigin;
  var more_origin = true.obs;
  var origins_active = [].obs;



  @override
  void onInit() {

    expandOriginController  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500)
    );
    animationOrigin = CurvedAnimation(
      parent: expandOriginController,
      curve: Curves.fastOutSlowIn,
    );
    expandOriginController.forward();
  }

  bool isContain(e) {
    if(origins_active.contains(e)) {
      return true;
    }
   return false;
  }
  void change_list(e){
    isContain(e) ? origins_active.remove(e) : origins_active.add(e);
  }

  void clear() {
    origins_active.clear();
  }
}