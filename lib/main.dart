
import 'package:app_casynet/bindings/home_bindings.dart';
import 'package:app_casynet/controller/bottom_nav_controller.dart';
import 'package:app_casynet/routes/app_pages.dart';
import 'package:app_casynet/screens/Cart/cart.dart';
import 'package:app_casynet/screens/account/account_login.dart';
import 'package:app_casynet/screens/detail_app.dart';
import 'package:app_casynet/screens/home.dart';
import 'package:app_casynet/screens/notfications.dart';
import 'package:app_casynet/widget/bottom_navigator.dart';
import 'package:app_casynet/widget/home/top_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () =>  GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        initialRoute: '/',
        initialBinding: HomeBindings(),
        getPages:  AppPages.routes ,
        home: MaterialApp(
          home: Home(),
        ),
      )
    );
  }
}


class Home extends StatelessWidget {
  var c = Get.put(BottomNavController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
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
        ),
      ),
    );
  }
}






