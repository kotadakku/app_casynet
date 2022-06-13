import 'package:app_casynet/app/data/repo/notification_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../config/api_params.dart';
import '../../../data/model/notification.dart';

class CreateNotificationController extends GetxController{
  final listCustomers = [].obs;
  final isSendEmail = true.obs;
  final countTextTitle = 0.obs;
  final countTextDescription = 0.obs;
  final isCreating = false.obs;

  NotificationModel notificationModel = NotificationModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void createNotification() async {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      notificationModel.toJsonApi();
      try{
        final result = await NotificationRepo().createNotificationModel(

        );

        if(result.statusCode== CODE_SUCCESS){
          isCreating.value = false;
        }
        else{
          isCreating.value = false;
          print(result.msg);
        }

      }catch(e){
        isCreating.value = false;
      }
    }

  }
}