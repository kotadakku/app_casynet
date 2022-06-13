

import 'package:app_casynet/app/config/config.dart';

class BannerSlider {
  int? id;
  String? htmlTag;

  BannerSlider({this.id, required this.htmlTag});

  factory BannerSlider.fromJson(Map<String, dynamic> json){
    return BannerSlider(
        id: json['id'],
        htmlTag: json['image']
    );
  }

  Map<String, dynamic> toJson() => {
    // DBConfig.BANNER_COLUMN_ID : id,
    DBConfig.BANNER_COLUMN_IMAGE : htmlTag
  };

}