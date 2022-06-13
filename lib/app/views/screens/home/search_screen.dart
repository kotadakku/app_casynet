
import 'package:app_casynet/app/controller/home/search_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final SearchController _searchController = Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(

          onSaved: (value){
          },
          onChanged: (value){

            _searchController.searchByText(value);

          },
          autofocus: true,
          style: TextStyle(
            fontSize: 15.sp,
            color: AppColors.textGrayColor,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none
            ),
            hintText: 'search'.tr
          ),

        ),
      ),
      body: Center(
        child: Text('search'.tr),
      )
    );
  }
}
