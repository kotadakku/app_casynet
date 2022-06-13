
import 'package:app_casynet/app/data/repo/news_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/api_params.dart';

class NewsManagerCotroller extends GetxController{
  var listSelected = [].obs;
  var isSelectedAll = false.obs;
  final isDeleting = false.obs;

  void deleteAllNews() async {
    try{
      final result = await NewsRepo(
      ).deleteAllNews();

      if(result.statusCode== CODE_SUCCESS){
        isDeleting.value = false;

      }
      else{
        isDeleting.value = false;
        print(result.msg);
      }

    }catch(e){
      isDeleting.value = false;
    }

  }
  void deleteNew(int id) async {
    try{
      final result = await NewsRepo(
      ).deleteNews(
        id: id
      );

      if(result.statusCode== CODE_SUCCESS){
        isDeleting.value = false;

      }
      else{
        isDeleting.value = false;
        print(result.msg);
      }

    }catch(e){
      isDeleting.value = false;
    }

  }

  void selectAllNew(bool value) {
    isSelectedAll.value = value;
    if(value == true){
      listSelected.addAll([0, 1, 2]);
    }
    else{
      listSelected.clear();
    }
  }

  bool ckeckInList(int index) {
    return listSelected.contains(index);
  }

}