class CategoryHome {
  String? iddanhmuc;
  String? tendanhmuc;
  String? anhdanhmuc;

  CategoryHome({this.iddanhmuc, this.tendanhmuc, this.anhdanhmuc});

  CategoryHome.fromJson(Map<String, dynamic> json) {
    iddanhmuc = json['id'];
    tendanhmuc = json['name'];
    if(json['custom_attributes']!=null){
      json['custom_attributes'].forEach((value){
        if(value['attribute_code']=='map_icon'){
          anhdanhmuc = value['value'];
        }
      });
    }

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Iddanhmuc'] = this.iddanhmuc;
    data['Tendanhmuc'] = this.tendanhmuc;
    data['Anhdanhmuc'] = this.anhdanhmuc;
    return data;
  }

}