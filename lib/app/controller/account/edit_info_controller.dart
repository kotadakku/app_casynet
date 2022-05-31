import 'package:app_casynet/app/data/provider/get_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../data/repo/account_repo.dart';

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
    if(title=='số điện thoại') isPhone = true;
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