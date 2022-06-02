import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/bindings/main_bindings.dart';
import 'app/controller/bottom_nav_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utlis/languages/localization_service.dart';
import 'app/views/screens/Cart/cart.dart';
import 'app/views/screens/account/account_base.dart';
import 'app/views/screens/detail_app.dart';
import 'app/views/screens/home/home.dart';
import 'app/views/screens/notfications.dart';
import 'app/views/screens/splash/splash_1.dart';
import 'app/views/theme/app_colors.dart';
import 'app/views/widgets/bottom_navigator.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(392, 816),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context) => OverlaySupport(
          child: GetMaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                appBarTheme: AppBarTheme(
                  color: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  elevation: 1,
                  centerTitle: true,
                  shadowColor: kTextColor,

                ),
                inputDecorationTheme: InputDecorationTheme(
                  errorStyle: TextStyle(
                    color: kYellowColor,
                  ),
                )
              // textTheme:

            ),
            builder: (context, widget) {
              Get.put<ScaffoldMessengerState>(ScaffoldMessenger.of(context));
              // ScreenUtil.setContext(context);
              return MediaQuery(

                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            locale: LocalizationService.locale,
            fallbackLocale: LocalizationService.fallbackLocale,
            translations: LocalizationService(),
            initialRoute: '/',
            initialBinding: MainBindings(),
            getPages:  AppPages.routes ,
            home: Splash_1(),
          )
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
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigator(),
        body:Obx(()=>IndexedStack(
          index: c.tabIndex.value,
          children: [
            HomePage(),
            NotificationPage(),
            Cart(),
            AccountBasePage(),
            DetailAppPage(),
          ],
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