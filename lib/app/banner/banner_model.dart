
class BannerTest {
  int? id;
  String image;

  BannerTest.init(this.id, this.image);
  BannerTest({this.id, required this.image});

  factory BannerTest.fromJson(Map<String, dynamic> json){
    return BannerTest(
        id: json['id'],
        image: json['image']);
  }

  Map<String, dynamic> tojson()=>{
    "id": id,
    "image": image
  };
}