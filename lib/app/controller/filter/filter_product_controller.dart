import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class FilterDisplayController extends GetxController with GetSingleTickerProviderStateMixin{
  var display = "Danh sách".obs;
  late AnimationController expandDisplayController;
  late Animation<double> animationDisplay;
  late Animation animationRotale;

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
    animationRotale = Tween(begin: 0.0, end: pi).animate(expandDisplayController);
    expandDisplayController.forward();
  }
  void expand(){
    expandDisplayController.isCompleted ? expandDisplayController.reverse(): expandDisplayController.forward();
  }
  void clear(){
    display.value = "Danh sách";
  }


}
class FilterAttrController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandAttrController;
  late Animation<double> animationAttr;
  late Animation animationRotale;
  var attr = "Mới nhất".obs;
  void expand(){
    expandAttrController.isCompleted ? expandAttrController.reverse():
        expandAttrController.forward();
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

    animationRotale = Tween(begin: 0.0, end: pi).animate(expandAttrController);
    expandAttrController.forward();
  }
}
class FilterCategoriesController extends GetxController with GetSingleTickerProviderStateMixin{
  late AnimationController expandFilterCategoriesController;
  late Animation<double> animationCategories;
  late Animation animationRotale;
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

    animationRotale = Tween(begin: 0.0, end: pi).animate(expandFilterCategoriesController);
    expandFilterCategoriesController.forward();
  }
  void expand(){
    expandFilterCategoriesController.isCompleted ? expandFilterCategoriesController.reverse(): expandFilterCategoriesController.forward();
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
  var distints_active = [].obs;
  late Animation animationRotale;

  @override
  void onInit() {
    expandDistrictController  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300)
    );
    animationDistrict = CurvedAnimation(
      parent: expandDistrictController,
      curve: Curves.fastOutSlowIn,
    );
    animationRotale = Tween(begin: 0.0, end: pi).animate(expandDistrictController);
    expandDistrictController.forward();
  }

  void expand(){
    expandDistrictController.isCompleted ?
    expandDistrictController.reverse() : expandDistrictController.forward();
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
  late Animation animationRotale;

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
    animationRotale = Tween(begin: 0.0, end: pi).animate(expandPriceController);
    expandPriceController.forward();
  }

  void expand(){
    expandPriceController.isCompleted ? expandPriceController.reverse():
        expandPriceController.forward();
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
      price_max.value = int.parse(value);
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
  var origins_active = [].obs;
  late Animation animationRotale;


  @override
  void onInit() {

    expandOriginController  = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000)
    );
    animationOrigin = CurvedAnimation(
      parent: expandOriginController,
      curve: Curves.fastOutSlowIn,
    );
    animationRotale = Tween(begin: 0.0, end: pi).animate(expandOriginController);
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

  void expand() {
    expandOriginController.isCompleted ? expandOriginController.reverse() : expandOriginController.forward();
  }
}