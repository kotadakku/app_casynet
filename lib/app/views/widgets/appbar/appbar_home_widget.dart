
import 'package:app_casynet/app/views/widgets/button_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/account/new_address_controller.dart';
import '../../../controller/bottom_nav_controller.dart';
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
    NewAddressController regioncontroller = Get.find<NewAddressController>();
    SearchController searchController = Get.find();
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Get.put(BottomNavController()).tabIndex.value = 0;
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
          cursorColor: kTextColor,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5.0.w),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: AppColors.borderGray_0_5
                  )

              ),
              hintStyle: TextStyle(
                  fontSize: 14.sp
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: kYellowColor
                  )

              ),
              hintText: 'search_hint'.tr,
              suffixIcon: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                  var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
                    "title": "Chọn tỉnh/ thành phố", "regions": regioncontroller.provinces
                  });
                  if(data != null){
                    data.then((value){
                      searchController.setLocation(value['name']);
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      VerticalDivider(
                        width: 20,
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                        color: AppColors.borderGray_0_5,
                      ),
                      SizedBox(width: 2.0.w,),
                      SvgPicture.asset(
                          "assets/images/home/icon_location.svg",
                          width: 14.sp),
                      SizedBox(width: 5.0.w,),
                      Obx(()=> Text(
                        searchController.location.value,
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 13,
                        ),
                      ),),
                      SizedBox(width: 5.0.w,),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
      actions: [
        ButtonLanguage()
      ],
    );
  }
}