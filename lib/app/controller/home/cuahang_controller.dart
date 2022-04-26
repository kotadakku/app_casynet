
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/model/cuahang.dart';
import '../../data/provider/cuahang_provider.dart';
class CuaHangController extends GetxController{
  List<CuaHang> cuahangList = [];
  var isCar = true;
  var isLoadStore = true;

  @override
  void onInit() {
    updateAPI();
  }

  void updateAPI(){
    isLoadStore = true;
    cuahangList.clear();
    CuaHangProvider().fetchCuaHangList(onSuccess: (data){
      print(data.length);
      cuahangList.addAll(data);
      isLoadStore = false;
      update();
    },onError: (error){
      isLoadStore = false;
      print(error);
    },
        loaixe: isCar? 1:0);
  }

  void updateIsCar(value){
    isCar = !value;
    update();
  }

  void callPhone(String s) {
    launch("tel:$s");
  }
}