import 'package:app_casynet/controller/authentication_manager.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationManager());
  }

}