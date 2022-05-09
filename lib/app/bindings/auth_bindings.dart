import 'package:app_casynet/app/controller/auth/auth_controller.dart';
import 'package:get/get.dart';

import '../controller/auth/authentication_manager.dart';
import '../controller/auth/user_db_controller.dart';

class AuthBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationManager());
    Get.lazyPut(() =>AuthController());
    Get.lazyPut(() => UserDatabaseController());
  }

}