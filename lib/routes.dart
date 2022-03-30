import 'package:app_casynet/controller/filter_controller.dart';
import 'package:app_casynet/controller/home_controller.dart';
import 'package:app_casynet/screens/details_store.dart';
import 'package:app_casynet/screens/filter/filter_product.dart';
import 'package:app_casynet/screens/filter/filter_product_2.dart';
import 'package:app_casynet/screens/home.dart';
import 'package:get/get.dart';

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
    name: '/detail_product/:productId',
    page: () => HomePage(),
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
