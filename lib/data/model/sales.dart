class Sales{
  int? id;
  String title;
  String action_url;
  String image;

  Sales.init(this.id, this.title, this.action_url, this.image);

  Sales({this.id, required this.title, required this.action_url, required this.image});

  factory Sales.fromJson(Map<String, dynamic> json){
    return Sales(
      id: int.parse(json['id']),
      title: json['title'],
      action_url: json['action_url'],
      image: json['image']);
  }
}