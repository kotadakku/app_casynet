class Origin {
  int? id;
  String? name;

  Origin({this.id, this.name});

  Origin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

}