

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../controller/home/api/region_controller.dart';
import '../../../../controller/home/appbar_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';

class ButtonSelectRegion extends StatelessWidget {
  ButtonSelectRegion({Key? key}) : super(key: key);
  RegionController _regionController = Get.find();
  AppbarController _appbarController = Get.find();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        var data = Get.toNamed(Routes.SELECT_REGION, arguments: {
          "title": "Chọn tỉnh/ thành phố", "regions": _regionController.provinces
        });
        if(data != null){
          data.then((value){
            _appbarController.setLocation(value.name);
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
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
                "assets/images/home/icon_location.svg",
                width: 14),
            SizedBox(width: 5.0.w,),
            Obx(()=> Text(
              _appbarController.location.value,
              style: TextStyle(
                color: AppColors.textGrayColor,
                fontSize: 13,
              ),
            ),),
            SizedBox(width: 5.0.w,),
          ],
        ),
      ),
    );
  }
}
