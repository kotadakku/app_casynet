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

  var ngaybatdau = new DateTime.now().obs;
  var ngayketthuc = new DateTime.now().obs;
  final isDisplay = false.obs;
  final startDate = "".obs;
  final expireDate = "".obs;
  final isSendEmail = true.obs;
  Gift gift = Gift();
  final isLoading = false.obs;

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
      isLoading.value = true;
      formKey.currentState!.save();


      try{
        final result = await GiftRepo().updateGift(
          id: 12
        );

        if(result.statusCode== CODE_SUCCESS){
          isLoading.value = false;
        }
        else{
          isLoading.value = false;
          print(result.msg);
        }

      }catch(e){
        isLoading.value = false;
      }

    }
  }

}