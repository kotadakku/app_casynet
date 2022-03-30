import 'package:app_casynet/controller/filter_controller.dart';
import 'package:app_casynet/controller/home_controller.dart';
import 'package:app_casynet/screens/account/account_base.dart';
import 'package:app_casynet/screens/account/account_login.dart';
import 'package:app_casynet/screens/detail_product.dart';
import 'package:app_casynet/screens/details_store.dart';
import 'package:app_casynet/screens/filter/filter_product.dart';
import 'package:app_casynet/screens/filter/filter_product_2.dart';
import 'package:app_casynet/screens/home.dart';
import 'package:get/get.dart';

import 'controller/detail_product.dart';

List<GetPage> routes = [
  GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBinding()),
  GetPage(
      name: '/filter',
      page:() => FilterProductPage2(),
      binding: FilterBinding(),
  ),
  GetPage(
    name: '/account/login',
    page: ()=>AccountLoginPage(),
  ),
  GetPage(
    name: '/account/base',
    page: ()=>AccountBasePage(),
  ),
  GetPage(
    name: '/detail_product/:productId',
    page: () => DetailProductPage(),
    binding: DetailProductBinding(),
  ),
  GetPage(
    name: '/detail_store/:storeId',
    page: () => DetailsStore()
  ),
  GetPage(
    name: '/account',
    page: () => HomePage()
  )
];
