import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class Splash_1 extends StatefulWidget {
  const Splash_1({Key? key}) : super(key: key);

  @override
  State<Splash_1> createState() => _Splash_1State();
}

class _Splash_1State extends State<Splash_1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffD4AD0B),
      child: Stack(
        children: [
          Center(
            child: Image.asset("assets/splash/logo-while.png"),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset("assets/splash/group_527.png"),
          )
        ],
      )
    );
  }
  @override
  void initState() {
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) => Get.offNamed('/home'));
  }
}
