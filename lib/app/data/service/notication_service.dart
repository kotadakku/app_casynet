import 'package:app_casynet/app/data/model/notification.dart';
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
        notificationList.add(notification);
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