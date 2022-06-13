class News{
  int? id;
  String? title;
  String? decription;
  List<String>? images;
  News();

  News.fromJson(e){

  }

  Map<String, dynamic> toJson(){
    return {};
  }

}