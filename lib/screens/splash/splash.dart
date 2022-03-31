import 'dart:async';

import 'package:app_casynet/screens/home.dart';
import 'package:app_casynet/screens/splash/splash_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    var width_widget = MediaQuery.of(context).size.width;
    return
      Container(
        color: Color(0xffD4AD0B),
        child: Stack(
          children: [
            Positioned(
              left: -1.0,
              top:  -10.0,
              child: SvgPicture.asset("assets/splash/path1484.svg",width: width_widget, )
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
            )
          ],
        ),
      )
      ;
  }

  @override
  void initState() {
    initialization();
  }

  Future<Timer> initialization() async {
    return Timer(Duration(seconds: 10),() => Get.toNamed('/home'));
  }
}
