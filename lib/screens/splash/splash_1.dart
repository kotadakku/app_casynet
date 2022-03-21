import 'package:flutter/material.dart';

class Splash_1 extends StatelessWidget {
  const Splash_1({Key? key}) : super(key: key);

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
}
