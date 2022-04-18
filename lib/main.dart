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
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
      designSize: Size(392, 816),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context) =>  GetMaterialApp(
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

    return WillPopScope(
      onWillPop:()=> _onWillPop(context),
      child: Material(
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
      ),
    ) ;
  }
  Future<bool> _onWillPop(BuildContext context) async {
    late bool? exitResult;
    if(Get.put(BottomNavController()).tabIndex.value == 0){
      exitResult = await showDialog(
        context: context,
        builder: (context) => _buildExitDialog(context),
      );
    }
    else {
      Get.put(BottomNavController()).tabIndex.value = 0;
      exitResult =  false;
    }

    return exitResult ?? false;
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Xác nhận'),
      content: const Text('Bạn có muốn thoát?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text('Không'),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: Text('Đồng ý'),
        ),
      ],
    );
  }
}