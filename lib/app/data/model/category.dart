class CategoryHome {
  int? id;
  String? name;
  String? imageUrl;

  CategoryHome({this.id, this.name, this.imageUrl});

  CategoryHome.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

}