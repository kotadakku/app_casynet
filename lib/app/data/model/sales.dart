class Sales{
  int? id;
  String title;
  String image;

  Sales.init(this.id, this.title, this.image);

  Sales({this.id, required this.title, required this.image});

  factory Sales.fromJson(Map<String, dynamic> json){
    return Sales(
      id: int.parse(json['id']),
      title: json['title'],
      image: json['image']);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }
}