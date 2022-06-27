import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/model/address.dart';
import '../../data/model/category.dart';
import '../../data/model/seller.dart';

class CreateSellerController extends GetxController {

  late var formKey;

  Address? address;
  late TextEditingController textProvinceCtr;
  late TextEditingController textDistrictCtr;
  late TextEditingController textShortDescription;

  var typeProSelected = "- Chọn -".obs;
  var image_selected = "".obs;
  var imgBackground_selected = "".obs;
  var nameSeller = "".obs;
  var btnTakePhoto = true.obs;
  var btnGalleryPhoto = true.obs;

  final open_time = "".obs;
  final close_time = "".obs;
  Seller seller = Seller();

  final linkFacebook = "".obs;
  final linkZalo = "".obs;
  final linkYoutube = "".obs;



  final listOtherCateSelected = <Category>[].obs;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    textProvinceCtr = TextEditingController(text: address?.province);
    textDistrictCtr = TextEditingController(text: address?.district);
    // textCommuneController = TextEditingController(text: '');
  }


  @override
  void onReady() {

    if(Get.arguments[0] != null){
      address = Get.arguments[0];
    }

  }

  void createSeller() {
    print(seller.toJsonDB());
  }

  Future<void> pickimagecamera({bool isCamera = true}) async {

    if(isCamera){
      final XFile? photo = await ImagePicker()
          .pickImage(source: ImageSource.camera);
      if (photo != null) {
        image_selected.value = photo.path;
      }
    }else{
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image != null){
        image_selected.value = image.path;
      }
    }

  }

  Future<void> pickimagecameraBackground({bool isCamera = true}) async {
    if(isCamera){
      final XFile? photoBg = await ImagePicker()
          .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery);
      if (photoBg != null) {
        imgBackground_selected.value = photoBg.path;
      }
    }else{
      final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image != null){
        imgBackground_selected.value = image.path;
      }
    }

  }

}
