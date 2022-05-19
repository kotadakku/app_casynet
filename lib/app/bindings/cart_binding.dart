import 'package:app_casynet/app/controller/cart/api/payment_method_controller.dart';
import 'package:app_casynet/app/controller/cart/api/shipping_method_controller.dart';
import 'package:get/get.dart';

import '../controller/cart/checkout_controller.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CheckoutController(), fenix: true);
    Get.lazyPut(() => PaymentMethodController(), fenix: true);
    Get.lazyPut(() => ShippingMethodController(), fenix: true);

  }

}