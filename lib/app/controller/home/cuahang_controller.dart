import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/model/cuahang.dart';

class CuaHangController extends GetxController{
  List<CuaHang> cuahangList = [];
  var isCar = true;
  var isLoadStore = true;

  @override
  void onInit() {
  }

  void updateIsCar(value){
    isCar = !value;
    update();
  }

  void callPhone(String s) {
    launch("tel:$s");
  }
}