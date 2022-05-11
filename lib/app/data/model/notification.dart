import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationModel{
  String? title;
  String? body;
  String? imageUrl;
  String? dataId;
  String? dataTitle;
  String? dataBody;
  String? dataImageUrl;
  bool? isSeen;
  DateTime? timeReveice;

  NotificationModel({this.title, this.body, this.imageUrl, this.dataId,
      this.dataTitle, this.dataBody, this.dataImageUrl, this.isSeen, this.timeReveice});

  NotificationModel.fromJson(RemoteMessage json){
    this.title = json.notification?.title;
    this.body = json.notification?.body;
    this.imageUrl = json.notification?.android?.imageUrl;
    this.dataId = json.data['id'];
    this.dataTitle = json.data['title'];
    this.dataBody = json.data['body'];
    this.dataImageUrl = json.data['image_url'];
    this.isSeen = false;
    this.timeReveice = DateTime.now();
  }
}