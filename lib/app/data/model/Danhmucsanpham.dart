class Danhmucsanpham {
  String? iddanhmuc;
  String? tendanhmuc;
  String? anhdanhmuc;

  Danhmucsanpham({this.iddanhmuc, this.tendanhmuc, this.anhdanhmuc});

  Danhmucsanpham.fromJson(Map<String, dynamic> json) {
    iddanhmuc = json['Iddanhmuc'];
    tendanhmuc = json['Tendanhmuc'];
    anhdanhmuc = json['Anhdanhmuc'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Iddanhmuc'] = this.iddanhmuc;
    data['Tendanhmuc'] = this.tendanhmuc;
    data['Anhdanhmuc'] = this.anhdanhmuc;
    return data;
  }

}