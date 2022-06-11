import 'package:get/get.dart';

import '../../../config/api_params.dart';
import '../../../data/repo/gift_repo.dart';

class GiftManagerController extends GetxController{
  final isLoadingGet = false.obs;
  final isLoading = false.obs;

  final listSelected = [].obs;
  final isSelectedAll = false.obs;

  final listGift = [].obs;

  bool ckeckInList(int id){
    return listSelected.contains(id);
  }

  void getGiftsApi() async {
    try{
      final result = await GiftRepo().getGifts(
      );

      if(result.statusCode== CODE_SUCCESS){
        isLoadingGet.value = false;

      }
      else{
        isLoadingGet.value = false;
        print(result.msg);
      }

    }catch(e){
      isLoadingGet.value = false;
    }
  }

  void deleteGift(int id) async{
    try{
      final result = await GiftRepo().deleteGift(
          id: id
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

  void deleteAllGift() async {
    try{
      final result = await GiftRepo().deleteAllGift(
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

  void selectAllGift(bool? value) {
    isSelectedAll.value = value!;
    if(value == false){
      listSelected.clear();
    } else{
      listSelected.addAll([0, 1, 2]);
    }

  }
}