
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/appbar/appbar_account_widget.dart';
import 'widgets/attribute_product_widget.dart';
import 'widgets/bottom_button.dart';
import 'widgets/district_product_widget.dart';
import 'widgets/origin_product_widget.dart';
import '../../theme/app_sizes.dart';
import 'widgets/price_product_widget.dart';

class FilterProductPage extends StatelessWidget {
  const FilterProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.arguments['controller'];
    return Scaffold(
      appBar: AppBarAccountWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xffF1F3FD),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.0.w),
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(5.0.w),
                      child: Icon(Icons.arrow_back_ios, size: AppSize.iconSize,),
                    ),
                    onTap: (){
                      Get.back();
                    },
                  ),
                  Text('filter_product'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //Quận huyện
            DistrictProductWidget(),
            Container(
              width: double.infinity,
              color: const Color(0xffF1F3FD),
              height: 10,
            ),
            //Thuộc tính
            AttributeProductWidget(),
            Container(
              width: double.infinity,
              color: const Color(0xffF1F3FD),
              height: 10,
            ),
            //Theo giá
            PriceProductWidget(),
            Container(
              width: double.infinity,
              color: const Color(0xffF1F3FD),
              height: 10,
            ),
            // Xuất xư
            OriginProductWidget(),
            Container(
              width: double.infinity,
              color: const Color(0xffF1F3FD),
              height: 10,
            ),
            //Bottom Button
            BottomButtonWidget(controller: controller,),
          ],
        ),
      ),
    );
  }
}
