import 'package:app_casynet/Cart/cart.dart';
import 'package:app_casynet/screens/account/account_login.dart';
import 'package:app_casynet/screens/detail_app.dart';
import 'package:app_casynet/screens/notfications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/home.dart';

class BottomNavController extends GetxController{
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}