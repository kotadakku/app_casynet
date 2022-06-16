
import 'package:app_casynet/app/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_sizes.dart';
import '../../../../widgets/image_network_loading.dart';

class ItemSellerWidget extends StatelessWidget {
  final int index;
  final sellers;

  const ItemSellerWidget({
    Key? key, required this.index, required this.sellers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(()=>GestureDetector(
            onTap: () {
              Get.toNamed(
                  Routes.STORE_DETAIL, arguments: { 'store':sellers[index]});
              FocusScope.of(context).unfocus();
            },
            child: SizedBox(
              height: 120.h,
              width:  200,
              child: ImageNetworkLoading(
                image_url: sellers[index].avatar_image.toString(),
                fit: BoxFit.fill,
              ),
            )
        ),),
        Container(
          padding: const EdgeInsets.all(5.0),
          color: const Color(0xffEFF1FC),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.thumb_up_alt_rounded,
                    color: AppColors.textGrayBoldColor,
                    size: AppSize.iconSize,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Obx(()=>Text('${this.sellers[index].likeQty  ?? 0}', style: TextStyle(fontSize: 13)))
                ],
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.comment,
                    size: AppSize.iconSize,
                    color: AppColors.textGrayBoldColor,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                 Obx(()=> Text('${sellers[index].commentQty ?? 0}',
                     style: TextStyle(fontSize: 13)))
                ],
              ),
              Row(
                children: [
                  Obx(()=>Text('${this.sellers[index].rate ?? 0.0}',
                      style: TextStyle(fontSize: 15)
                  ),),
                  const SizedBox(
                    width: 2,
                  ),

                  const Icon(
                    Icons.star_outlined,
                    color: AppColors.textGrayBoldColor,
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(()=>
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                        Routes.STORE_DETAIL,
                        arguments: { 'store': sellers[index]});
                    FocusScope.of(context).unfocus();
                  },
                  child: Text(sellers[index].name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15.sp
                    ),
                  )
              ),)
            ),
            InkWell(
              onTap: (){
                _homController.callPhone(sellers[index].phone.toString());
              },
              child: Container(
                padding: const EdgeInsets.all(5.0),
                child: FaIcon(
                  FontAwesomeIcons.phoneFlip,
                  color: AppColors.textGrayBoldColor,
                  size: AppSize.iconSize,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.mapLocationDot,
                    color: AppColors.textGrayBoldColor,
                    size: 15,
                  ),
                  SizedBox(
                    width: 3.0.w,
                  ),
                  Expanded(
                      child: Obx(()=>Text(
                        '${sellers[index].address ?? 'no-info'.tr}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.sp),
                      )))
                ],
              ),
            ),
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.locationArrow,
                  color: AppColors.textGrayBoldColor,
                  size: 15.0,
                ),
                const SizedBox(
                  width: 3,
                ),
                Obx(()=>Text(
                  "${sellers[index].distance.toStringAsFixed(2) ?? 0.0} km",
                  style: TextStyle(fontSize: 12.sp),
                ))
              ],
            ),
          ],
        ),
      ],
    );
  }
}