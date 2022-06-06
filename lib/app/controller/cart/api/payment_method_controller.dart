import 'package:app_casynet/app/data/model/checkout/payment_method.dart';
import 'package:app_casynet/app/data/model/checkout/shipping_method.dart';
import 'package:app_casynet/app/data/provider/get_storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repo/cart_repo.dart';
import '../checkout_controller.dart';

class PaymentMethodController extends GetxController with StateMixin{
  final _paymentMethodList = <PaymentMethod>[].obs;


  @override
  void onInit() {
    CheckoutController checkoutController = Get.find();
    getPaymentMethod(checkoutController.shippingMethod, checkoutController.address_default.countryId);
  }

  Future<void> getPaymentMethod(ShippingMethod shippingMethod, String? countryId) async {
    final token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
    CheckoutController checkoutController = Get.find();
    change(_paymentMethodList, status: RxStatus.loading());
    if(countryId != null && shippingMethod.methodCode != null){
      try{
        final result = await CartRepo().getPaymentMethod(
            options: Options(
                headers: {
                  'Authorization' : 'Bearer $token'
                }
            ),
            data: shippingMethod.toJson(countryId)
        );
        if(result != null){
          if(result.isSuccess){
            _paymentMethodList.value = result.listObjects ?? [];
            checkoutController.onChangeItem(_paymentMethodList.first);
            if(_paymentMethodList.isEmpty){
              change(_paymentMethodList, status: RxStatus.empty());
            }
            change(_paymentMethodList, status: RxStatus.success());

          }
          else{
            Get.snackbar('noti'.tr, result.msg.toString(),
                backgroundColor: Colors.black.withOpacity(0.3));
            change(_paymentMethodList, status: RxStatus.error());
          }
        }
      } catch(error) {
        Get.snackbar('noti'.tr, "error:: $error",
            backgroundColor: Colors.black.withOpacity(0.3));
        change(_paymentMethodList, status: RxStatus.error());
      }
    }
    else{
      change(_paymentMethodList, status: RxStatus.empty());
    }
  }
}