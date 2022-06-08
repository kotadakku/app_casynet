
import 'package:get/get.dart';

class SelectOriginController extends GetxController {

  var selectId = 0.obs;
  var selectIdEnd = 0.obs;
  final isChange = false.obs;

  void onSaveValue() {
    selectIdEnd.value = selectId.value;
    isChange.value = false;
  }

  void changeValue(int? value, String name){
    if(value == selectIdEnd.value){
      isChange.value = false;
      selectId.value = value!;
    }
    else{
      isChange.value = true;
      selectId.value = value!;
    }
  }
}