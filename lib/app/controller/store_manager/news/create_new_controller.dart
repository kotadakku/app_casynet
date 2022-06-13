import 'dart:io';

import 'package:app_casynet/app/data/repo/news_repo.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../config/api_params.dart';
import '../../../data/model/news.dart';

class CreateNewController extends GetxController{
  List<dynamic> imagepicker = [].obs;
  var x = "".obs;
  late File imagepk;
  late Future<void> initializeVideoPlayerFuture;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ScaffoldMessengerState scaffoldMessenger = Get.find<ScaffoldMessengerState>();
  News news = News();
  final isCreating = false.obs;
  var countTenSP = 0.obs;
  var countMoTaSP = 0.obs;

  var controller=VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/images/videos/butterfly.mp4").obs;

  void createNew() async {
    if(formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        final result = await NewsRepo().createNews(
          data: dio.FormData.fromMap(await news.toJson()),
        );
        if (result.statusCode == CODE_SUCCESS) {
          // product.value = result.objects ?? Product();
          // if(_sellerDetail){
          //   change(_sellerDetail, status: RxStatus.empty());
          //   return;
          // }
          isCreating.value = false;
          Get.back();
          scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Thêm thành công!'),
                duration: Duration(seconds: 1)),
          );
        } else {
          print(result.msg.toString());
          isCreating.value = false;
          scaffoldMessenger.showSnackBar(
              const SnackBar(content: Text('Thêm thất bại!'),
                  duration: Duration(seconds: 1)
              )
          );
        }
      } catch (error) {
        print(error.toString());
        isCreating.value = false;
        scaffoldMessenger.showSnackBar(
            const SnackBar(
                content: Text('Thêm thất bại!'), duration: Duration(seconds: 1)
            )
        );
      }
    }
  }
  Future pickvideo() async {
    final XFile? video = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (video != null) {
      imagepk = File(video.path);
      imagepicker.add(imagepk);
    }
    return imagepicker;
  }
  Future hienvideo() async{
    if(imagepicker.length>0){
      for(int i=0;i<imagepicker.length;i++){
        if(imagepicker[i].toString().contains(".mp4")){
          controller.value = VideoPlayerController.file((imagepicker[i]));
          initializeVideoPlayerFuture = controller.value.initialize();
          controller.value.setLooping(true);
          controller.value.setVolume(1.0);
        }
      }
    }
  }
  Future pickimagecamera() async {
    final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
    if (photo != null) {
      imagepk = File(photo.path);
      imagepicker.add(imagepk);
    }
  }

  Future pickimage() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null) {
      for(int i=0;i<images.length;i++){
        imagepk = File(images[i].path);
        imagepicker.add(imagepk);
      }
    }
  }
}
