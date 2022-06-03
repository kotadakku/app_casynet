
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/product_detail/detail_product_controller.dart';
import '../../../../controller/store_detail/detail_store_controller.dart';
import '../../../../routes/app_pages.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';

class InformationStoreWidget extends StatelessWidget {
  DetailProductController controller;
  InformationStoreWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 20,),
        Padding(padding: EdgeInsets.only(left: 5.0.w),
          child: ListTile(
            leading: CircleAvatar(
              child: Text("123"),
            ),
            title: Text('${controller.product.value.seller?.name ?? 'Chưa có thông tin'}'),
            subtitle: Row(
              children: [
                Text('${controller.product.value.seller?.ownerShop ?? 'Chưa có thông tin'}',
                  style: TextStyle(
                    color: AppColors.yellowColor,
                    fontSize: 12.sp
                ),),
                SizedBox(width: 10,),
                Row(
                  children: [
                    Obx(()=>Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          color: controller.isLive.value ? Colors.green: AppColors.yellowColor,
                          borderRadius: BorderRadius.circular(8)
                      ),
                    ),),
                    SizedBox(width: 5,),
                    Text("Hoạt động cách đây 3 giờ trước",
                      style: TextStyle(
                          color: AppColors.textGrayColor,
                          fontSize: 12.sp
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: AppColors.yellowColor, size: AppSize.iconSize,),
                      Text('${controller.product.value.seller?.totalProduct ?? '0'}', style: TextStyle(
                          color: AppColors.yellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Sản phẩm")
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: AppColors.yellowColor, size: AppSize.iconSize,),
                      Text("${controller.product.value.seller?.rateFeedback ?? '0'}%", style: TextStyle(
                          color: AppColors.yellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Tỉ lệ phản hồi")
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.add, color: AppColors.yellowColor, size: AppSize.iconSize,),
                      Text("${controller.product.value.seller?.totalTransaction ?? '0'}", style: TextStyle(
                          color: AppColors.yellowColor,
                          fontWeight: FontWeight.w800
                      ),)
                    ],
                  ),
                  Text("Giao dịch")
                ],
              )
            ],
          )
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: Row(
            children: [
              Flexible(child: Container(
                height: 30,
                child: Obx(()=>
                  ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border, color: controller.followed.value ? Colors.white: AppColors.yellowColor, size: AppSize.iconSize,),
                          SizedBox(width: 5,),
                          Text("Theo dõi",
                            style: TextStyle(
                              color: controller.followed.value ? Colors.white: AppColors.yellowColor,
                            ),
                          )
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          primary:controller.followed.value ? AppColors.yellowColor: Colors.white,
                          onPrimary: AppColors.yellowColor,
                          side: BorderSide(
                            color: AppColors.yellowColor,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                      ),
                      onPressed: () {
                        print("Followed");
                        controller.followed.value = !controller.followed.value;
                      },
                    )
                ),
              ),),
              SizedBox(width: 10.w,),
              Flexible(child:  Container(
                height: 30,
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.share, size: AppSize.iconSize,),
                      SizedBox(width: 5,),
                      Text("Xem cửa hàng",
                        style: TextStyle(
                        ),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.yellowColor,

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))
                  ), onPressed: () {
                    Get.toNamed(Routes.STORE_DETAIL,
                      arguments: {
                        'store': controller.product.value.seller
                      }
                    );
                },
                ),
              ),),
            ],
          ),
        )
      ],
    );
  }
}
