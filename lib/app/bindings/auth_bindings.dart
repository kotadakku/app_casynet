import 'package:get/get.dart';

import '../controller/authentication_manager.dart';

class AuthBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationManager());
  }

}