class Origin {
  String? id;
  String? name;

  Origin({this.id, this.name});

  Origin.fromJson(Map<String, dynamic> json) {
    id = json['Idxuaxu'];
    name = json['Tenxuatxu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Idxuaxu'] = this.id;
    data['Tenxuatxu'] = this.name;
    return data;
  }
}