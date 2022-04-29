import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  RxString location = "Hà Nội".obs;
  var printText = "ha noi";

  setLocation( String value){
    value = value.replaceAll("Tỉnh ", "");
    value = value.replaceAll("Thành phố ", "");
    location.value = value;
  }
}