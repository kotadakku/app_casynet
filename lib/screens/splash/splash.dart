import 'dart:async';

import 'package:app_casynet/routes/app_pages.dart';
import 'package:app_casynet/screens/splash/splash_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../controller/authentication_manager.dart';

class Splash extends StatelessWidget {
  final AuthenticationManager _authmanager = Get.put(AuthenticationManager());
  Splash({Key? key}) : super(key: key);

  Future<void> initializeSettings() async {
    _authmanager.checkLoginStatus();
    //Simulate other services for 3 seconds
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Color(0xffD4AD0B),
            child: Stack(
              children: [
                Positioned(
                    left: -1.0,
                    top:  -10.0,
                    child: SvgPicture.asset("assets/splash/path1484.svg",width: ScreenUtil().screenWidth, )
                ),
                Positioned(
                  child: Center(
                    child: Image.asset("assets/splash/logo-while.png"),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Stack(
                    children: [
                      Positioned(
                          bottom:  -10.0,
                          child: SvgPicture.asset("assets/splash/path1483.svg")
                      ),
                      Positioned(
                        bottom: -10,
                        child: SvgPicture.asset("assets/splash/path1482.svg"),
                      ),
                      Positioned(
                          bottom: -15,
                          left: -30,
                          child: SvgPicture.asset("assets/splash/path1481.svg")
                      )
                    ],
                  ),
                ),
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          );
        } else {
          if (snapshot.hasError)
            return Text("error");
          else
            return Splash_1();
        }
      },
    );



  }

  // Future<Timer> initialization() async {
    //   Future<void> initializeSettings() async {
    //     _authmanager.checkLoginStatus();
    //
    //     //Simulate other services for 3 seconds
    //     await Future.delayed(Duration(seconds: 3));
    //   }
    //   return  await Timer(Duration(seconds: 4),() => Get.off(()=>,
    //     transition: Transition.fadeIn,
    //     duration: Duration(milliseconds: 1000)
    //   ));
    // }
}
