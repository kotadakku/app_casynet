import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/api_params.dart';
import '../../../data/model/gift.dart';
import '../../../data/repo/gift_repo.dart';

class UpdateGiftController extends GetxController{
  List<dynamic> imagepicker = [].obs;
  var x = "".obs;
  late File imagepk;
  final isDisplay = false.obs;
  final startDate = "".obs;
  final expireDate = "".obs;
  final isSendEmail = true.obs;
  Gift gift = Gift();
  final isUpdating = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  Future pickimage() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      imagepk = File(image.path);
      imagepicker.add(imagepk);
    }
  }

  void updateGift(int id) async {
    if(formKey.currentState!.validate()){
      isUpdating.value = true;
      formKey.currentState!.save();


      try{
        final result = await GiftRepo().updateGift(
          id: 12
        );

        if(result.statusCode== CODE_SUCCESS){
          isUpdating.value = false;
        }
        else{
          isUpdating.value = false;
          print(result.msg);
        }

      }catch(e){
        isUpdating.value = false;
      }

    }
  }

}