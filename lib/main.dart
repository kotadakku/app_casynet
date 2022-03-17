import 'package:app_casynet/screens/account/account_base.dart';
import 'package:app_casynet/screens/account/account_login.dart';
import 'package:app_casynet/screens/auth/auth.dart';
import 'package:app_casynet/screens/home.dart';
import 'package:app_casynet/screens/location.dart';
import 'package:app_casynet/splash/splash.dart';
import 'package:app_casynet/splash/splash_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}



