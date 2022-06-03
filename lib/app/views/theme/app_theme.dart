import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class AppTheme{
  static ThemeData appTheme = ThemeData(
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
        shadowColor: AppColors.textGrayColor,

      ),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle: TextStyle(
          color: AppColors.yellowColor,
        ),
      )
  );
}