import 'package:app_casynet/app/data/model/order.dart';
import 'package:get/get.dart';

import '../../data/provider/order_api_provider.dart';

class FetchOrderController extends GetxController{
  List<Order> orders = [];


  @override
  void onInit() {
    getOrdersApi();
  }

  void getOrdersApi(){
    OrderApiProvider().getAllOrder(onSuccess: (data){
      orders.addAll(data);
    },
    onError: (error) => print(error)
    );
  }
}