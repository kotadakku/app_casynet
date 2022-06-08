
import 'package:app_casynet/app/data/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../config/api_params.dart';

class OriginController extends GetxController{
  final originList = [].obs;
  final isLoadingAPI = false.obs;
  final error = "".obs;

  @override
  void onInit() {
    _getOriginApi();
  }

  void _getOriginApi() async {
    isLoadingAPI.value = true;
    try{
      final result = await HomePageRepo().getOrigins(
          queryParameters : {

          },
        options: Options()
      );

      if(result.statusCode == CODE_SUCCESS){
        originList.value = result.listObjects ?? [];
        isLoadingAPI.value = false;

        if(originList.isEmpty){
          error.value = "Không có dữ liệu";
        }
      }
      else{
        isLoadingAPI.value = false;
        error.value = "${result.msg.toString()}";
        print(result.msg.toString());
      }

    } catch(e){
      print(e);
      error.value = "Hệ thống đang có vấn đề!!";
      isLoadingAPI.value = false;
    }
  }
}