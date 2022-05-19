
class BannerSliderNew {
  // int? id;
  List<String>? imageHtml = [];

  BannerSliderNew.init( this.imageHtml);
  BannerSliderNew({this.imageHtml});

  Future<Map<String, dynamic>?> toJson() async {
      return{
      'banner': imageHtml,
      };
  }

  // gán vào ui
   BannerSliderNew.fromJson(Map<String, dynamic> data){
    print(data);
    // BannerSliderNew(imageHtml: data['banner'.replaceAll("\\", "").split(">")]);
    // imageHtml = data['banner'.replaceAll("\\", "replace").split(">")];
    if (data['banner'.replaceAll("\\", "replace").split(">")] != null){
      data['banner'.replaceAll("\\", "replace").split(">")].forEach((value){
        imageHtml = [];
        imageHtml?.add(value);
      });
    }
  }
}