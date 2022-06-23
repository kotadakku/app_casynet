import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_colors.dart';
import '../../../../widgets/image_network_loading.dart';

class ItemCategoryWidget extends StatelessWidget {

  final String image_url;
  final String title;
  final int? id;
  ItemCategoryWidget({Key? key,required this.image_url, required this.title, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          Get.toNamed(Routes.PRODUCTS_BY_CATEGORY, arguments: [title, id, null]);
        },
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ImageNetworkLoading(image_url: image_url, width: 50, height: 50,),
              Text(title, style:  TextStyle(fontSize: 15.0.sp),),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(
                  color: AppColors.backgroundColor
              )
          ),
        ),
      ) ;
  }
}