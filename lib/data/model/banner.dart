class Banner{
  int id;
  String image;

  Banner.init(this.id, this.image);
  Banner({required this.id, required this.image});

  factory Banner.fromJson(Map<String, dynamic> json){
    return Banner(
      id: int.parse(json['id']),
      image: json['image']
    );
  }

}