
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../theme/app_colors.dart';

class AppBarAccountWidget extends StatelessWidget implements PreferredSizeWidget {

  // You also need to override the preferredSize attribute.
  // You can set it to kToolbarHeight to get the default appBar height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Container(
        padding: EdgeInsets.only(left: 5.0.w),
          child: SvgPicture.asset(
            "assets/home/icon_top_home.svg",
            width: 30,
          )
      ),
      leadingWidth: 40,
      title: Container(
        height: 40,
        child:  TextField(
          textAlignVertical: TextAlignVertical.center,
          cursorColor: kYellowColor,
          style: TextStyle(
              fontSize: 15,
              color: kTextColor_gray
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0.h),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kYellowColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintStyle: const TextStyle(
                  fontSize: 15
              ),
              hintText: 'Search Casynet',
              prefixIcon: SizedBox(width: 50, child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                  child: Row(
                    children: [
                      // Icon vị trí
                      Icon(Icons.search, color: kYellowColor,),
                      VerticalDivider(
                        width: 10,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                        color: Colors.grey,
                      ),
                    ],
                  )
              ),),

              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    VerticalDivider(
                      width: 10,
                      thickness: 1,
                      indent: 5,
                      endIndent: 5,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 2.0.w,),
                    SvgPicture.asset(
                        "assets/home/icon_location.svg",
                        width: 14),
                    SizedBox(width: 5.0.w,),
                    const Text(
                      "Hà Nội",
                      style: TextStyle(
                        color: kTextColor_gray,
                        fontSize: 13
                      ),
                    ),
                    SizedBox(width: 5.0.w,),
                  ],
                ),
              )
          ),
        ),
      ),
      actions: [
        Container(
          width: 40,
          margin: EdgeInsets.only(right: 5.0.w, top: 10.0, bottom: 10.0),
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller){
                return TextButton(
                  onPressed: () {
                    controller.setIsVN();
                  },
                  child: Text(controller.languageToString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp
                    ),
                  ),
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                        color: AppColors.borderGray_0_5,

                      )
                  ),
                );
              },
            )
        )
      ],
    );
  }
}