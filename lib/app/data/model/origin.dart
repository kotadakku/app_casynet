class Xuatxu {
  String? idxuaxu;
  String? tenxuatxu;

  Xuatxu({this.idxuaxu, this.tenxuatxu});

  Xuatxu.fromJson(Map<String, dynamic> json) {
    idxuaxu = json['Idxuaxu'];
    tenxuatxu = json['Tenxuatxu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Idxuaxu'] = this.idxuaxu;
    data['Tenxuatxu'] = this.tenxuatxu;
    return data;
  }
}