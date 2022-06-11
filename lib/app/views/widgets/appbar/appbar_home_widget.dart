
import 'package:app_casynet/app/views/widgets/appbar/widgets/buttom_select_region.dart';
import 'package:app_casynet/app/views/widgets/button_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/account/address/new_address_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../controller/home/search_controller.dart';
import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';

class AppBarHomeWidget extends StatelessWidget implements PreferredSizeWidget {

  // You also need to override the preferredSize attribute.
  // You can set it to kToolbarHeight to get the default appBar height.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Get.put(HomeController()).tabIndex.value = 0;
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
      leadingWidth: 50,
      title: Container(
        height: 40,
        child:  TextField(
          readOnly: true,
          onTap: (){
            Get.toNamed(Routes.SEARCH);
          },

          textAlignVertical: TextAlignVertical.center,
          cursorColor: AppColors.textGrayColor,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.0.w),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: AppColors.textGrayColor
                  )

              ),
              hintStyle: TextStyle(
                  fontSize: 14.sp
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: AppColors.yellowColor
                  )

              ),
              hintText: 'search_hint'.tr,
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