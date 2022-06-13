import 'package:app_casynet/app/data/repo/notification_repo.dart';
import 'package:get/get.dart';

import '../../../config/api_params.dart';

class NotificationManagerController extends GetxController{
  final isLoadingGet = false.obs;
  final isDeleting = false.obs;

  final listSelected = [].obs;
  final isSelectedAll = false.obs;

  final listNoti = [].obs;

  bool ckeckInList(int id){
    return listSelected.contains(id);
  }

  void getNotificationsApi() async {
    try{
      final result = await NotificationRepo().getNotificationModels(
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
      final result = await NotificationRepo().deleteNotificationModel(
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

  void deleteAllNotifications() async {
    try{
      final result = await NotificationRepo().deleteAllNotificationModel(
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

  void selectAllNoti(bool? value) {
    isSelectedAll.value = value!;
    if(value == false){
      listSelected.clear();
    } else{
      listSelected.addAll([0, 1, 2]);
    }

  }
}