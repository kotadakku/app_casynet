import 'package:app_casynet/app/config/api_params.dart';
import 'package:app_casynet/app/data/repo/order_repo.dart';
import 'package:get/get.dart';

class OrderManagerApiController extends GetxController{
  final allOrderList = [].obs;
  final confirmOrderList = [].obs;
  final processedOrderList = [].obs;
  final cancelOrderList = [].obs;
  final isLoading = false.obs;

  void getAllOrder() async {
    isLoading.value = true;
    try{
      final result = await OrderRepo().getOrders(
          queryParameters: {

          }
      );
      if(result.statusCode == CODE_SUCCESS){
        isLoading.value = false;
        allOrderList.addAll(result.listObjects ?? []);
      }
      else {
        isLoading.value = false;
      }
    } catch(error){
      isLoading.value = false;
    }
  }
  void getConfirmOrder() async {
    isLoading.value = true;
    try{
      final result = await OrderRepo().getOrders(
          queryParameters: {

          }
      );
      if(result.statusCode == CODE_SUCCESS){
        isLoading.value = false;
        confirmOrderList.addAll(result.listObjects ?? []);
      }
      else {
        isLoading.value = false;
      }
    } catch(error){
      isLoading.value = false;
    }
  }
  void getCancelOrder() async {
    isLoading.value = true;
    try{
      final result = await OrderRepo().getOrders(
          queryParameters: {

          }
      );
      if(result.statusCode == CODE_SUCCESS){
        isLoading.value = false;
        cancelOrderList.addAll(result.listObjects ?? []);
      }
      else {
        isLoading.value = false;
      }
    } catch(error){
      isLoading.value = false;
    }
  }
  void getProcessedOrder() async {
    isLoading.value = true;
    try{
      final result = await OrderRepo().getOrders(
          queryParameters: {

          }
      );
      if(result.statusCode == CODE_SUCCESS){
        isLoading.value = false;
        processedOrderList.addAll(result.listObjects ?? []);
      }
      else {
        isLoading.value = false;
      }
    } catch(error){
      isLoading.value = false;
    }
  }

}