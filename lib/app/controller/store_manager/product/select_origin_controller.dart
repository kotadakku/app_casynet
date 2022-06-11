
import 'package:app_casynet/app/controller/store_manager/product/add_product_controller.dart';
import 'package:get/get.dart';

import '../../../data/model/origin.dart';

class SelectOriginController extends GetxController {

  var selectOrigin = Origin().obs;
  var selectIdEnd = 0.obs;
  final isChange = false.obs;
  AddProductController _addProductController = Get.find();


  @override
  void onInit() {
    selectOrigin.value = _addProductController.selectOrigin.value;
  }

  void onSaveValue() {

    _addProductController.selectOrigin.value = selectOrigin.value;
    isChange.value = false;
  }

  void changeValue(Origin origin){
    if(origin.id ==  _addProductController.selectOrigin.value.id){
      isChange.value = false;
      selectOrigin.value = origin;
    }
    else{
      isChange.value = true;
      selectOrigin.value = origin;
    }
  }
}