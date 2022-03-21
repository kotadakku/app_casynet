import 'package:app_casynet/screens/account/account_base.dart';
import 'package:app_casynet/screens/account/account_login.dart';
import 'package:app_casynet/screens/auth/auth.dart';
import 'package:app_casynet/screens/detail_product.dart';
import 'package:app_casynet/screens/filter/filter_product.dart';
import 'package:app_casynet/screens/filter/filter_product_map.dart';
import 'package:app_casynet/screens/home.dart';
import 'package:app_casynet/screens/location.dart';
import 'package:app_casynet/screens/notfications.dart';
import 'package:app_casynet/screens/rua_xe_thay_dau.dart';
import 'package:app_casynet/screens/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DetailProductPage(),
    );
  }
}



