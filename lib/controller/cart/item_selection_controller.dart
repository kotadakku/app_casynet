import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class ItemSelectionController extends GetxController{
  var selectedItem = "".obs;

  onChangeItem(var valueItem){
    selectedItem.value = valueItem;

  }
}