import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/api_params.dart';
import '../../../data/model/notification.dart';
import '../../../data/repo/notification_repo.dart';

class UpdateNotificationController extends GetxController{
  final listCustomers = [].obs;
  final isSendEmail = true.obs;
  final countTextTitle = 0.obs;
  final countTextDescription = 0.obs;
  final isCreating = false.obs;

  NotificationModel notificationModel = NotificationModel();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void createNotification(int id) async {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      notificationModel.toJsonApi();
      try{
        final result = await NotificationRepo().updateNotificationModel(
            id: id
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