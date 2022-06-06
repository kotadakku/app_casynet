import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/model/seller.dart';

class CreateSellerController extends GetxController{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final open_time = "".obs;
  final close_time = "".obs;
  Seller seller = Seller();

  @override
  void onInit() {

  }

  void createSeller() {
    print(seller.toJsonDB());
  }
}