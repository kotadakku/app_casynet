import 'package:app_casynet/app/config/config_db.dart';

class Category {
  int? id;
  String? name;
  String? imageUrl;

  Category({this.id, this.name, this.imageUrl});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if(json['custom_attributes']!=null){
      json['custom_attributes'].forEach((value){
        if(value['attribute_code']=='map_icon'){
          imageUrl = 'https://client.casynet.com/pub/media/catalog/category/'+ value['value'];
        }
      });
    }

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[DBConfig.CATEGORY_COLUMN_ID] = this.id;
    data[DBConfig.CATEGORY_COLUMN_TITLE] = this.name;
    data[DBConfig.CATEGORY_COLUMN_IMAGE] = this.imageUrl;
    return data;
  }
}