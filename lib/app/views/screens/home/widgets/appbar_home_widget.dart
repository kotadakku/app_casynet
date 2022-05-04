
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/account/new_address_controller.dart';
import '../../../../controller/home/search_controller.dart';
import '../../../../controller/bottom_nav_controller.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';

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
              "assets/home/icon_top_home.svg",
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
              hintText: 'Search Casynet',
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
                          "assets/home/icon_location.svg",
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