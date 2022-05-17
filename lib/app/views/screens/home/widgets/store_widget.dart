
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home/api/seller_controller.dart';
import '../../../../controller/home/cuahang_controller.dart';
import '../../../../controller/home/radio_controller.dart';
import '../../../../data/model/seller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
import '../../../widgets/image_network_loading.dart';
import '../../../widgets/shimmer/seller_shimmer.dart';
import '../../../widgets/shimmer_loading.dart';
import 'items/seller_item.dart';


class StoreWidget extends StatelessWidget {
  StoreWidget({Key? key}) : super(key: key);
  SellerController _sellerController = Get.find();
  @override
  Widget build(BuildContext context) {
    RadioController controller = Get.find();
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Material(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15.0.w, right: 15.0),
                        child: CircleAvatar(
                          child: Text(
                            "123",
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Color(0xffDFB400),
                        ),
                      ),
                      Text(
                        'store'.tr.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xffDFB400),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'more'.tr,
                        style: TextStyle(
                          color: Color(0xffB7BAC1),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0.w),
                        child: SvgPicture.asset(
                          "assets/home/store/icon_xemthem.svg",
                          width: 6.0,
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(()=>Row(
                      children: [
                        Radio(
                            value: true,
                            groupValue: controller.isCarStore.value,
                            onChanged: (value) {
                              controller.updateIsCarStore();
                            },
                            activeColor: Color(0xffDFB400)),
                        Text("Ô tô"),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                            value: false,
                            groupValue: controller.isCarStore.value,
                            onChanged: (value) {
                              controller.updateIsCarStore();
                            },
                            activeColor: Color(0xffDFB400)),
                        Text("Xe máy")
                      ],
                    ))
                  ],
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Get.toNamed(Routes.FILTER_MAP);
                  },

                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/home/store/icon_filter.svg",
                        width: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'filter'.tr,
                        style: TextStyle(
                          color: Color(0xffB7BAC1),
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),

          _sellerController.obx((state) =>
              Container(
                padding: EdgeInsets.only(bottom: 20.0.h),
                child: state.isEmpty ? Text("Không có cửa hàng để hiển thị")
                    : Wrap(
                    spacing: 5.0.w,
                    runSpacing: 10.0,
                    children: (state as List) .map((e) =>
                        ItemSellerWidget(
                          store: e,
                        ))
                        .toList()),
              ),
            onLoading: ItemSellerShimmer(),
          ),
        ],
      ),
    );
  }
}





