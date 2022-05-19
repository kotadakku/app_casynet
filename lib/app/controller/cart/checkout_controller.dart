import 'package:app_casynet/app/data/model/checkout/payment_method.dart';
import 'package:app_casynet/app/data/model/checkout/shipping_method.dart';
import 'package:get/get.dart';

import '../../data/model/address.dart';
import '../auth/authentication_manager.dart';

class CheckoutController extends GetxController{
  RxString selectPayment = "".obs;
  RxString selectShippingMethod ="".obs;
  ShippingMethod shippingMethod = ShippingMethod();
  Address address_default = Address();


  @override
  void onInit() {
    AuthenticationManager authenticationManager = Get.find();
    if(authenticationManager.user_current.addresses.isNotEmpty){
      address_default = authenticationManager.user_current.addresses
          .where((element) => element.default_shipping == true).first;
    }
  }

  onChangeItem(PaymentMethod value){
    selectPayment.value = value.code??'';

  }
  onChangeSelectShipping(ShippingMethod shippingMethod){
    selectShippingMethod.value = shippingMethod.carrierCode ??'';
    shippingMethod = shippingMethod;
  }
}