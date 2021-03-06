import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../data/model/user.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/user_repo.dart';
import '../auth/authentication_manager.dart';

class AccountDetailController extends GetxController{
  var date_birthday = "".obs;
  var image_selected = "".obs;
  final user = User().obs;


  @override
  void onInit() {
    AuthenticationManager authenticationManager = Get.find();
    user.value = authenticationManager.user_current.value;
  }

  Future<void> pickimagecamera({bool isCamera = false}) async {
    final XFile? photo = await ImagePicker().pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (photo != null) {
      image_selected.value = photo.path;
    }
  }
  Future<void> updateUser() async {
    AuthenticationManager authenticationManager = Get.find();
    try{
      final token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
      final result = await UserRepo().updateUserAccount(
          data: user.value.toEditJson(),
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
              }
          )
      );
      if(result != null){
        if(result.isSuccess){
          authenticationManager.user_current.value = result.objects ?? User();
        }
        else{
          printError(info: result.msg.toString());
        }


      }
    } catch(error){
        printError(info: error.toString());
      }
    }
}