
import 'package:app_casynet/bindings/home_bindings.dart';
import 'package:app_casynet/controller/bottom_nav_controller.dart';
import 'package:app_casynet/routes/app_pages.dart';
import 'package:app_casynet/screens/Cart/cart.dart';
import 'package:app_casynet/screens/account/account_login.dart';
import 'package:app_casynet/screens/detail_app.dart';
import 'package:app_casynet/screens/home.dart';
import 'package:app_casynet/screens/notfications.dart';
import 'package:app_casynet/widget/bottom_navigator.dart';
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
        home: Home(),
      ),
    ) ;
  }
}


class Home extends StatelessWidget {
  var c = Get.put(BottomNavController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigator(),
      body:Obx(()=>IndexedStack(
        index: c.tabIndex.value,
        children: [
          HomePage(),
          NotificationPage(),
          Cart(),
          AccountLoginPage(),
          DetailAppPage(),
        ],
      ),)
    );
  }
}






