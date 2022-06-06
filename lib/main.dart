import 'dart:io';

import 'package:app_casynet/app/views/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'app/bindings/main_bindings.dart';
import 'app/controller/home/home_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utlis/languages/localization_service.dart';
import 'app/views/screens/Cart/cart.dart';
import 'app/views/screens/account/account_base.dart';
import 'app/views/screens/app_detail/detail_app.dart';
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
            theme: AppTheme.appTheme,
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
  final HomeController _homeController = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop:()=> _onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigator(),
        body:Obx(()=>IndexedStack(
          index: _homeController.tabIndex.value,
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
    if(_homeController.tabIndex.value == 0){
      exitResult = await showDialog(
        context: context,
        builder: (context) => _buildExitDialog(context),
      );
    }
    else {
      _homeController.tabIndex.value = 0;
      exitResult =  false;
    }

    return exitResult ?? false;
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: Text('confirm'.tr),
      content: Text('do-quit'.tr),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(result: false),
          child: Text(
            'no'.tr, style: TextStyle(
            color: Colors.red
          ),
          ),
          style: ElevatedButton.styleFrom(

          ),
        ),
        TextButton(
          onPressed: () => Get.back(result: true),
          child: Text('yes'.tr),
        ),
      ],
    );
  }

}