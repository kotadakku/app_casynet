import 'package:app_casynet/data/model/cuahang.dart';
import 'package:app_casynet/data/provider/cuahang_provider.dart';
import 'package:get/get.dart';
class CuaHangController extends GetxController{
  List<CuaHang> cuahangList = [];
  var isCar = true;

  @override
  void onInit() {
    updateAPI();
  }

  void updateAPI(){
    cuahangList.clear();
    CuaHangProvider().fetchCuaHangList(onSuccess: (data){
      print(data.length);
      cuahangList.addAll(data);
      update();
    },onError: (error){
      print(error);
    },
        loaixe: isCar? 1:0);
  }

  void updateIsCar(value){
    isCar = !value;
    update();
  }
}