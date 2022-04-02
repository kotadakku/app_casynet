import 'package:app_casynet/bindings/home_bindings.dart';
import 'package:app_casynet/routes/app_pages.dart';
import 'package:app_casynet/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      initialBinding: HomeBindings(),
      getPages:  AppPages.routes ,
      home: MaterialApp(
        home: HomePage(),
      ),
    ) ;
  }
}



