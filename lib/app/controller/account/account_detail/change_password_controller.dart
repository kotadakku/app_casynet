import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class ChangePasswordController extends GetxController{
  var isObscurePassword = true.obs;
  var isObscureConfirmPassword = true.obs;
  changeObscurePassword(value) => isObscurePassword.value = value;
  changeObscureConfirmPassword(value) => isObscureConfirmPassword.value = value;
}