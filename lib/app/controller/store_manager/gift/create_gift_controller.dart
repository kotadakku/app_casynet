import 'dart:io';

import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/repo/gift_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/model/gift.dart';

class CreateGiftController extends GetxController{
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

  void createGift() async {
    if(formKey.currentState!.validate()){
      isLoading.value = true;
      formKey.currentState!.save();


      try{
        final result = await GiftRepo().createGift(

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