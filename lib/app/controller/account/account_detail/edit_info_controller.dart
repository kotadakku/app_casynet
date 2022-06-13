import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInfoController extends GetxController{
  final isChange = false.obs;
  final isSave = true.obs;
  late String title;
  bool isPhone = false;
  late String current_value;
  late TextEditingController textEditingController;

  @override
  void onInit() {
    title = Get.arguments[0];
    if(title=='phone') isPhone = true;
    current_value = Get.arguments[1];
    textEditingController = TextEditingController(
        text: current_value
    );
  }

  void checkOnSave(String value) {
    if(value != current_value){
      isSave.value = false;
      isChange.value = true;
    }
  }

  void onSaveValue() {
    if(isChange.isTrue){
      isChange.value = false;
      isSave.value = false;
      current_value = textEditingController.text;
    }
  }
}