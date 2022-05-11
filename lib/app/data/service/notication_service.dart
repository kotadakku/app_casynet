import 'package:app_casynet/app/data/model/notification.dart';
import 'package:app_casynet/app/data/provider/db/config_db.dart';
import 'package:app_casynet/app/data/provider/db/db_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../controller/bottom_nav_controller.dart';
class NotificationService extends GetxController{
  final List<NotificationModel> notificationList = [];

  late final FirebaseMessaging _messaging;
  late var totalNotificationCounter = 0;
  BottomNavController _bottomNavController = Get.find();

  @override
  void onInit() {

    // get all db sqlite
    DatabaseHelper.instance.getAlls(DBConfig.TABLE_NOTIFICATION, DBConfig.NOTI_COLUMN_TIMERECEIVE).then((value) {
      if(value?.length == 0){

      }
      else{
        value?.forEach((element) {
          print(element[DBConfig.NOTI_COLUMN_TITLE]);
          notificationList.add(NotificationModel(
              dataTitle: element[DBConfig.NOTI_COLUMN_TITLE],
              dataBody: element[DBConfig.NOTI_COLUMN_BODY],
              imageUrl: element[DBConfig.NOTI_COLUMN_IMAGE_URL],
              isSeen: element[DBConfig.NOTI_COLUMN_ISSEEN],
              timeReceive: element[DBConfig.NOTI_COLUMN_TIMERECEIVE]
          ));
        });
        update();
      }
    });


   // sự kiện lắng nghe
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      NotificationModel notification = NotificationModel.fromJson(message);
      notificationList.add(notification);
      if(_bottomNavController.tabIndex == 1) updateSeenNotification();
      updateTotalNotication();
      update();
    });

    registerNotification();
    checkForInitialMessage();
    updateTotalNotication();
  }
  void registerNotification() async {
    _messaging = FirebaseMessaging.instance;

    NotificationSettings settings= await _messaging.requestPermission(
        alert: true,
        badge: true,
        provisional: false,
        sound: true
    );

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("User granted the permission");

      FirebaseMessaging.onMessage.listen((message) {


        NotificationModel notification = NotificationModel.fromJson(message);

        // DatabaseHelper.instance.
        // luu sqlite : insert,
        DatabaseHelper.instance.insert(DBConfig.TABLE_NOTIFICATION, notification.toJson()).then((value) {
          notificationList.add(notification);
        });

        // ham get


        updateTotalNotication();

        if(_bottomNavController.tabIndex == 1) updateSeenNotification();
        update();

        if(notification != null){
          showSimpleNotification(
              Text(notification.title.toString()),
              leading: Image.network(notification.imageUrl.toString()),
              subtitle: Text(notification.body!),
              background: Colors.cyan.shade700,
              duration: Duration(seconds: 2),
          );
        }
      });
    }
    else {
      print("permission declined by user");
    }

  }

  checkForInitialMessage() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    if(initialMessage != null){
      print('<Init Message> ${initialMessage.data}');
      NotificationModel notification = NotificationModel.fromJson(initialMessage);
      notificationList.add(notification);
      if(_bottomNavController.tabIndex == 1) updateSeenNotification();
      updateTotalNotication();
      update();

    }
  }

  void updateTotalNotication(){
    totalNotificationCounter = notificationList.where((element) => element.isSeen ==false).length;
    update();
  }

  void updateSeenNotification(){
    totalNotificationCounter = 0;
    notificationList.where((element) => element.isSeen==false).forEach((e) => notificationList[notificationList.indexOf(e)].isSeen =true);
    update();
  }


}