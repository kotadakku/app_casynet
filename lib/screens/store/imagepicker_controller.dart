import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var selectedImagePath = "".obs;
  var selectedImageSize = "".obs;
  var selectedVideoPath = "".obs;
  List<dynamic> imageAndVideoPicker = [].obs;
  var x = "".obs;
  late File imagepk;
  void getImage(ImageSource imageSource) async {
    final List<XFile>? imagePickedFile = await ImagePicker().pickMultiImage();
    if (imagePickedFile != null) {
      for(int i = 0; i<imagePickedFile.length; i++){
        print(imagePickedFile[i].path);
        imagepk = File(imagePickedFile[i].path);
        imageAndVideoPicker.add(imagepk);
      }

      /*selectedImagePath.value = imagePickedFile.path;
      // selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+" Mb";

      if (imagePickedFile != null) {
        imagepk = File(imagePickedFile.path);
        imageAndVideoPicker.add(imagepk);
      }*/
    } else {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }

  }

  void getImageCamera(ImageSource imageSource) async {
    final  imagePickedFile = await ImagePicker().pickImage(source: imageSource);
    if (imagePickedFile != null) {

      selectedImagePath.value = imagePickedFile.path;
      // selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+" Mb";

      if (imagePickedFile != null) {
        print(imagePickedFile.path);
        imagepk = File(imagePickedFile.path);
        imageAndVideoPicker.add(imagepk);
      }
    } else {
      Get.snackbar("Error", "No image selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }

  }


  void getVideo(ImageSource imageSource) async {
    final videoPickedFile = await ImagePicker().pickVideo(source: imageSource);
    if (videoPickedFile != null) {
      selectedImagePath.value = videoPickedFile.path;
      imageAndVideoPicker.add(File(videoPickedFile.path));
      selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2)+" Mb";
    } else {
      Get.snackbar("Error", "No video selected",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }

  }

  @override
  void onClose() {}

  @override
  void onReady() {}

  @override
  void onInit() {}


}
