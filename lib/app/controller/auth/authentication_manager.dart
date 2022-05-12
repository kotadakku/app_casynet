
import 'package:app_casynet/app/controller/cart/item_product_in_cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/user.dart';
import '../../data/provider/auth_provider.dart';
import 'cache_manager.dart';


class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  late User user_current = User();
  ProductCartMeController _productCartMeController = Get.find();
  void logOut() {
    isLogged.value = false;
    removeUser();
    removeToken();
    _productCartMeController.clearCart();
  }

  Future<void> login(String token) async {
    //Token is cached
    await saveToken(token);
    await fetchUser(token);

    isLogged.value = true;
  }

  void registerUser(User user){
    AuthProvider().fetchRegister(user: user,
        onSuccess: (data){
          if(data!=null){
            login(data.token);
          }
        },
        onError: (error) {
          Get.defaultDialog(
              middleText: '$error!',
              textConfirm: 'OK',
              confirmTextColor: Colors.white,
              onConfirm: () {
                Get.back();
              });
        }
    );
  }

  Future<void> fetchUser(String token ) async {
    final user = getUsers();

    if(user != null){
      print("<AUTH> GET DB");
      user_current = user;
    }
    else{
      print("<AUTH> GET API");
      _productCartMeController.updateAPI(token);
       await AuthProvider().fetchCurrentUser(
          token: token,
          onSuccess: (data) async {
            if (data != null) {
              user_current = await  User.successLogin(data);
              saveUsers(data);
              update();
            }
          },
          onError: (error) {
            print(error);
            logOut();
          }
      );
    }
  }


  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      fetchUser(token);
      isLogged.value = true;
    }
    print(isLogged.value);
  }
}