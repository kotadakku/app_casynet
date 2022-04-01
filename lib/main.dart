import 'package:app_casynet/routes.dart';
import 'package:app_casynet/screens/detail_product.dart';
import 'package:app_casynet/screens/details_store.dart';
import 'package:app_casynet/screens/home.dart';
import 'package:app_casynet/screens/splash/splash.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      initialBinding: HomeBinding(),
      getPages:  routes ,
      home: MaterialApp(
        home: HomePage(),
      ),
    ) ;
  }
}



