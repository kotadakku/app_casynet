import 'package:get/get.dart';
import '../../controller/account/auth/auth_controller.dart';


class AuthBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>AuthController());
  }

}