import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/data.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  final listProductSearch = [].obs;
  final isSearching = false.obs;
  final error = ''.obs;

  void searchByText(String value) async {
    try{
      final result = await ProductRepo().getProducts(
        queryParameters: {

        },
        options: Options(
          headers: {

          }
        )
      );
      if(result.statusCode == CODE_SUCCESS){
        isSearching.value = true;
        listProductSearch.value = result.listObjects?? [];
      }
      else{
        error.value = result.msg.toString();
        isSearching.value = true;
      }
    }catch(e){
      error.value = 'Hệ thống đang có vấn đề';
      isSearching.value = true;
    }
  }

}