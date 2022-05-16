import 'package:app_casynet/app/config/config_db.dart';

class BannerSlider{
  int? id;
  String image;

  BannerSlider.init(this.id, this.image);
  BannerSlider({this.id, required this.image});

  factory BannerSlider.fromJson(Map<String, dynamic> json){
    return BannerSlider(
      id: json['id'],
      image: json['image']
    );
  }

  Map<String, dynamic> toJson() => {
    DBConfig.BANNER_COLUMN_ID : id,
    DBConfig.BANNER_COLUMN_IMAGE : image
  };
}