class Imagesanpham {
  String? idimagesp;
  String? tenimage;

  Imagesanpham({this.idimagesp, this.tenimage});

  Imagesanpham.fromJson(Map<String, dynamic> json) {
    idimagesp = json['Idimagesp'];
    tenimage = json['Tenimage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Idimagesp'] = this.idimagesp;
    data['Tenimage'] = this.tenimage;
    return data;
  }
}