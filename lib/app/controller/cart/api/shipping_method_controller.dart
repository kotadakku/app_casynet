import 'package:app_casynet/app/controller/cart/api/payment_method_controller.dart';
import 'package:app_casynet/app/data/model/checkout/shipping_method.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/address.dart';
import '../../../data/provider/get_storage_provider.dart';
import '../../../data/repo/cart_repo.dart';
import '../checkout_controller.dart';

class ShippingMethodController extends GetxController with StateMixin{
  final _shippingMethodList = <ShippingMethod>[].obs;

  @override
  void onInit() {
    CheckoutController checkoutController = Get.find();
    getShippingMethod(checkoutController.address_default);
    if(checkoutController.address_default.countryId != null){
      ;
    }
    else{
      change(_shippingMethodList, status: RxStatus.empty());
    }

  }

  Future<void> getShippingMethod(Address address) async {
    final token = await GetStorageProvider().get(key: CacheManagerKey.TOKEN.toString());
    CheckoutController checkoutController = Get.find();
    PaymentMethodController paymentMethodController = Get.find();
    change(_shippingMethodList, status: RxStatus.loading());
    if(checkoutController.address_default.countryId != null){
      try{
        final result = await CartRepo().getShippingMethod(
            options: Options(
                headers: {
                  'Authorization' : 'Bearer $token'
                }
            ),
            data: address.toJsonShipping()
        );

        if(result != null){
          if(result.isSuccess){
            _shippingMethodList.value = result.listObjects ?? [];
            checkoutController.onChangeSelectShipping(_shippingMethodList.first);
            paymentMethodController.getPaymentMethod(_shippingMethodList.first, address.countryId);
            if(_shippingMethodList.isEmpty){
              change(_shippingMethodList, status: RxStatus.empty());
            }
            change(_shippingMethodList, status: RxStatus.success());
          }
          else{
            Get.snackbar('noti'.tr, result.msg.toString(),
                backgroundColor: Colors.black.withOpacity(0.3));
            change(_shippingMethodList, status: RxStatus.error());
          }
        }
      } catch(error) {
        Get.snackbar('noti'.tr, "error:: $error",
            backgroundColor: Colors.black.withOpacity(0.3));
        change(_shippingMethodList, status: RxStatus.error());
      }
    }
    else{
      change(_shippingMethodList, status: RxStatus.empty());
    }
  }
}