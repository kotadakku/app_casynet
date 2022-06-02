
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';

class SearchSreen extends StatelessWidget {
  const SearchSreen({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    // SearchController controller = Get.put(SearchController());
    /*var printText = "".obs;*/

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(

          onSaved: (value){
          },
          onChanged: (value){
            String test = value;
            print(test);
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
