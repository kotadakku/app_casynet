import 'package:flutter/material.dart';

import 'app_colors.dart';

var themes = ThemeData(
    primarySwatch: Colors.green,

    appBarTheme: AppBarTheme(
      color: Colors.green,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500
      ),
      iconTheme: IconThemeData(
        color: Colors.green,
      ),

      elevation: 1,
      centerTitle: true,
      shadowColor: kTextColor,


    ),
    // textTheme:

);