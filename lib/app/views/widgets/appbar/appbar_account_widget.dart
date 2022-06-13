
import 'package:app_casynet/app/controller/home/api/region_controller.dart';
import 'package:app_casynet/app/views/widgets/appbar/widgets/buttom_select_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/account/address/new_address_controller.dart';
import '../../../controller/home/bottombar_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/home/appbar_controller.dart';
import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../button_language.dart';

class AppBarAccountWidget extends StatelessWidget implements PreferredSizeWidget {

  // You also need to override the preferredSize attribute.
  // You can set it to kToolbarHeight to get the default appBar height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  BottombarController _bottombarController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          _bottombarController.tabIndex.value = 0;
          Get.offNamed(Routes.HOME);
        },
        child: Container(
            padding: EdgeInsets.only(left: 5.0.w),
            child: SvgPicture.asset(
              "assets/images/home/icon_top_home.svg",
              width: 40,
            )
        ),
      ),
      leadingWidth: 40,
      title: Container(
        height: 40,
        child:  TextField(
          textAlignVertical: TextAlignVertical.center,
          cursorColor: AppColors.yellowColor,
          readOnly: true,
          onTap: (){
            Get.toNamed(Routes.SEARCH);
          },
          style: TextStyle(
              fontSize: 15,
              color: AppColors.textGrayBoldColor
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5.0.h),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.yellowColor),
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
                      Icon(Icons.search, color: AppColors.yellowColor,),
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

              suffixIcon: ButtonSelectRegion()
          ),
        ),
      ),
      actions: [
        ButtonLanguage()
      ],
    );
  }
}