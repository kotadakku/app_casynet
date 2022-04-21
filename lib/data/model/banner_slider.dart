class BannerSlider{
  int? id;
  String image;

  BannerSlider.init(this.id, this.image);
  BannerSlider({this.id, required this.image});

  factory BannerSlider.fromJson(Map<String, dynamic> json){
    return BannerSlider(
      id: json['id'],
      image: json['image']
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image
  };
}