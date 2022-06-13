import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app_casynet/app/config/config.dart';

class NotificationModel{
  String? title;
  String? body;
  String? imageUrl;
  String? dataId;
  String? dataTitle;
  String? dataBody;
  String? dataImageUrl;
  bool? isSeen;
  bool? isSendEmail;
  List<int>? customers;
  DateTime? timeReceive;

  NotificationModel({this.title, this.body, this.imageUrl, this.dataId,
      this.dataTitle, this.dataBody, this.dataImageUrl, this.isSeen, this.timeReceive});

  NotificationModel.fromJson(RemoteMessage json){
    this.title = json.notification?.title;
    this.body = json.notification?.body;
    this.imageUrl = json.notification?.android?.imageUrl;
    this.dataId = json.data['id'];
    this.dataTitle = json.data['title'];
    this.dataBody = json.data['body'];
    this.dataImageUrl = json.data['image_url'];
    this.isSeen = false;
    this.timeReceive = DateTime.now();
  }

  Map<String, dynamic> toJson()  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
      // data['id'] = this.dataId;
      data[DBConfig.NOTI_COLUMN_TITLE] = this.dataTitle ??  this.title;
      data[DBConfig.NOTI_COLUMN_BODY] = this.dataBody ?? this.body;
      data[DBConfig.NOTI_COLUMN_IMAGE_URL] = this.dataImageUrl ?? this.imageUrl;
      data[DBConfig.NOTI_COLUMN_ISSEEN] = this.isSeen.toString();
      data[DBConfig.NOTI_COLUMN_TIMERECEIVE] = this.timeReceive.toString();
      return data;
      /*'id': dataId,
      'title': dataTitle,
      'body': dataBody,
      'image_url': dataImageUrl,
      'isseen': isSeen,
      'timereceive': timeReceive,*/
     }

  Map<String, dynamic> toJsonApi()  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.dataId;
    data["title"] = this.dataTitle ??  this.title;
    data['description'] = this.dataBody ?? this.body;
    data['isSendEmail'] = this.dataImageUrl ?? this.imageUrl;
    data['customers'] = this.isSeen.toString();
    return data;
  }
}