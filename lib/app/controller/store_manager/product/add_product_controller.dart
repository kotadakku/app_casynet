
import 'dart:io';

import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/model/product.dart';
import 'package:app_casynet/app/data/repo/product_repo.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../data/model/category.dart';
import '../../../data/model/origin.dart';
import '../../../views/screens/store_manager/UI_cacmenuch/UI_dichvusanpham/UI_ThemSPDV.dart';

class AddProductController extends GetxController{

  var date = new DateTime.now().obs;
  final clsp = Get.put(chonloaisp());
  final name = TextEditingController();
  final motasanpham = TextEditingController();
  final soluongnhapkho = TextEditingController();
  final soluongconlai = TextEditingController();
  final gia = TextEditingController();
  final giakhuyenmai = TextEditingController();
  var demname = 0.obs;
  var demmotasanpham = 0.obs;
  var status = false.obs;
  var statushttc = false.obs;
  var textst = "không".obs;
  var textsthtsp = "không".obs;
  var textsthttc = "không".obs;
  var chon = "".obs;
  var cc="".obs;
  List<dynamic> imagepicker = [].obs;
  var x = "".obs;
  late File imagepk;

  var controller=VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/images/videos/butterfly.mp4").obs;
  late Future<void> initializeVideoPlayerFuture;
  var playpause = false.obs;

  final listCategorySelected = <Category>[].obs;
  final selectOrigin = Origin().obs;
  final isDisplay = true.obs;
  final isFeatured = true.obs;
  final isOption = false.obs;
  final isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ScaffoldMessengerState scaffoldMessenger = Get.find<ScaffoldMessengerState>();

  Product product = Product();

  @override
  void onInit() {
    soluongnhapkho.text = '0';
    soluongconlai.text= '0';
    gia.text = '0';
  }

  void saveProduct() async {
    if(formKey.currentState!.validate()){
     isLoading.value = true;
     formKey.currentState!.save();
     product.categories?.clear();

     listCategorySelected.value.forEach((element) {
       product.categories?.add(element.id!);
     });
     imagepicker.forEach((element) {
       print((element as File).path);
       product.images?.add((element as File).path);
     });
     product.requiredOptions = isOption.value ? 1 : 0;
     product.isDisplay = isDisplay.value;
     product.isFeatured = isFeatured.value;
     product.originId = selectOrigin.value.id;

     print(await product.toJson());
     isLoading.value = false;

     try{
       final result = await ProductRepo().createProduct(
         sellerId: 1,
         data: dio.FormData.fromMap(await product.toJson()),
         options: Options(
             headers: {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqb2huIiwicm9sZXMiOlsiUk9MRV9NQU5BR0VSIiwiUk9MRV9VU0VSIl0sImlzcyI6Ii9sb2dpbiIsImV4cCI6MTY1NDc0MTk4Mn0.X6A8NE7NYIYW8BiGQDNVwJKDK1BNXacV8KO_pck9FEc'}
         ),
       );
       if (result.statusCode == CODE_SUCCESS) {
         // product.value = result.objects ?? Product();
         // if(_sellerDetail){
         //   change(_sellerDetail, status: RxStatus.empty());
         //   return;
         // }
         isLoading.value = false;
         Get.back();
         scaffoldMessenger.showSnackBar(
           const SnackBar(content: Text('Thêm thành công!'), duration: Duration(seconds: 1)),
         );
       }
       else{
         print(result.msg.toString());
         isLoading.value = false;
         scaffoldMessenger.showSnackBar(
           const SnackBar(content: Text('Thêm thất bại!'), duration: Duration(seconds: 1)
           )
         );
       }
     } catch (error){
       print(error.toString());
       isLoading.value = false;
       scaffoldMessenger.showSnackBar(
         const SnackBar(content: Text('Thêm thất bại!'), duration: Duration(seconds: 1)
         )
       );
     }
    }
  }

  Future<void> pickFile({String type = 'img', bool isCamera = true }) async {
    switch(type){
      case 'img' : {
        if(isCamera){
          final XFile? photo = await ImagePicker().pickImage(source:ImageSource.camera);
          if (photo != null) {
            imagepk = File(photo.path);
            imagepicker.add(imagepk);
          }
        }
        else{
          final List<XFile>? images = await ImagePicker().pickMultiImage();
          if (images != null) {
            for(int i=0;i<images.length;i++){
              imagepk = File(images[i].path);
              imagepicker.add(imagepk);
            }
          }
        }

      }
      break;
      case 'vid':{
        if(isCamera){
          final XFile? video = await ImagePicker().pickVideo(source: isCamera ? ImageSource.gallery: ImageSource.camera);
          if (video != null) {
            imagepk = File(video.path);
            imagepicker.add(imagepk);
          }
        }
      }
    }
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
  void showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Thêm ảnh-video sản phẩm'),
        // message: const Text('Message'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              pickFile();
              Get.back();
            },
            child: Text('take_photo'.tr),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              pickFile(isCamera: false);
              Get.back();
            },
            child: Text('gallery_photo'.tr),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              pickFile(type: 'vid');
              Get.back();
            },
            child: Text('take_video'.tr),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              pickFile(type: 'vid', isCamera: false);
              Get.back();
            },
            child: Text('gallery_video'.tr),
          )
        ],
      ),
    );
  }
  void showbottonsheet(context){
    showModalBottomSheet(context: context,backgroundColor: Colors.transparent, builder: (context){
      return Container(
        height: 255,
        margin: EdgeInsets.only(left: 5,right: 5),
        child: Column(
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text("Thêm ảnh-video sản phẩm",style: TextStyle(color: Colors.grey,),),
                onPressed: (){

                },
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text("Chụp ảnh",style: TextStyle(color: Colors.blue,),),
                onPressed: (){
                  pickFile();
                },
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text("Quay video",style: TextStyle(color: Colors.blue,),),
                onPressed: (){
                  pickFile(type: 'vid');

                },
              ),
            ),Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text("Thư viện ảnh",style: TextStyle(color: Colors.blue,),),
                onPressed: (){
                  pickFile(type: 'img', isCamera: false);
                },
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text("Thư viện video",style: TextStyle(color: Colors.blue,),),
                onPressed: (){
                  pickFile(type: 'vid', isCamera: false);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Text("Hủy",style: TextStyle(color: Colors.black,),),
                onPressed: (){
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}