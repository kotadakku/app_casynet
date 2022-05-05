
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/bindings/main_bindings.dart';
import 'app/controller/bottom_nav_controller.dart';
import 'app/routes/app_pages.dart';
import 'app/utlis/languages/localization_service.dart';
import 'app/views/screens/Cart/cart.dart';
import 'app/views/screens/account/account_base.dart';
import 'app/views/screens/detail_app.dart';
import 'app/views/screens/home/home.dart';
import 'app/views/screens/notfications.dart';
import 'app/views/screens/splash/splash.dart';
import 'app/views/theme/app_colors.dart';
import 'app/views/widgets/bottom_navigator.dart';


void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
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
      builder: (context) =>  GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarColor: Colors.white
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
        home: Splash(),
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
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onPanDown: (value) {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
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
      )
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