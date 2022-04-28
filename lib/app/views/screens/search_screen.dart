
import 'package:app_casynet/app/views/screens/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSreen extends StatelessWidget {
  const SearchSreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          autofocus: true,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.textGrayBoldColor,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none
            ),
            hintText: "Search"
          ),

        ),
      ),
      body: Center(
        child: Text(""
            "Tìm kiếm"),
      )
    );
  }
}
