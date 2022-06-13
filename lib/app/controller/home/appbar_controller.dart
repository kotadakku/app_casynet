import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarController extends GetxController{
  RxString location = "Hà Nội".obs;

  setLocation( String value){
    value = value.replaceAll("Tỉnh ", "");
    value = value.replaceAll("Thành phố ", "");
    location.value = value;
  }
}