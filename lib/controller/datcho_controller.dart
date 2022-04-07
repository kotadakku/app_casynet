import 'package:app_casynet/data/model/datcho.dart';
import 'package:app_casynet/data/provider/datcho_provider.dart';
import 'package:get/get.dart';
class DatChoController extends GetxController{
  List<DatCho> datchoList = [];
  var isCar = true;

  @override
  void onInit() {
    updateAPI();
  }

  void updateAPI(){
    datchoList.clear();
    DatChoProvider().fetchDatChoList(onSuccess: (data){
      datchoList.addAll(data);
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