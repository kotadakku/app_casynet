class Responses<T>{
  bool isSuccess;
  int? statusCode;
  String? msg;
  List<T>? listObjects;
  T? objects;

  Responses({this.isSuccess = false, this.statusCode, this.msg, this.listObjects, this.objects});
}