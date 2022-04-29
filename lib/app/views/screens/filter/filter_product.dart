
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widgets/account/appbar_account_widget.dart';
import '../../widgets/filter/attribute_product_widget.dart';
import '../../widgets/filter/bottom_button.dart';
import '../../widgets/filter/district_product_widget.dart';
import '../../widgets/filter/origin_product_widget.dart';
import '../../widgets/filter/price_product_widget.dart';
import '../../theme/app_sizes.dart';

class FilterProductPage extends StatelessWidget {
  const FilterProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: Icon(Icons.arrow_back_ios, size: sizeIcon.width,),
                    ),
                    onTap: (){
                      Get.back();
                    },
                  ),
                  Text("Lọc sản phẩm",
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
            BottomButtonWidget(),
          ],
        ),
      ),
    );
  }
}
