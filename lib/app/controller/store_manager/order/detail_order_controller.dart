import 'package:app_casynet/app/data/model/order.dart';
import 'package:get/get.dart';

import '../../../config/api_params.dart';
import '../../../data/repo/order_repo.dart';

class DetailOrderController extends GetxController{
  Order order = Order();
  final isLoading = false.obs;

  @override
  void onInit() {
    // getOrder();
  }
  void getOrder() async {
    isLoading.value = true;
    try{
      final result = await OrderRepo().getOrder(
          queryParameters: {

          }
      );
      if(result.statusCode == CODE_SUCCESS){
        isLoading.value = false;
        order = result.objects ?? Order();
      }
      else {
        isLoading.value = false;
      }
    } catch(error){
      isLoading.value = false;
    }
  }

}