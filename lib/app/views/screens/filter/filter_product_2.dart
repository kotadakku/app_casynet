
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../widgets/appbar/appbar_account_widget.dart';
import 'widgets/attribute_product_widget.dart';
import 'widgets/bottom_button.dart';
import 'widgets/category_product.dart';
import 'widgets/display_product.dart';
import 'widgets/district_product_widget.dart';
import '../../theme/app_sizes.dart';

class FilterProductPage2 extends StatelessWidget {
  final controller;
  const FilterProductPage2({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBarAccountWidget(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: const Color(0xffF1F3FD),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
              DisplayProductWidget(),

              //Quận huyện

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
              CategoryProductWidget(),
              Container(
                width: double.infinity,
                color: const Color(0xffF1F3FD),
                height: 10,
              ),

              DistrictProductWidget(),
              Container(height: 10,color: Color(0xffF1F3FD),),
              //Bottom Button
              BottomButtonWidget(controller : controller),
            ],
          ),
        ),
      )
    );
  }
}
