
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/filter/filter_product_controller.dart';
import '../../../theme/app_colors.dart';

class PriceProductWidget extends StatelessWidget {
  final FilterPriceController controller = Get.find<FilterPriceController>();
  PriceProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
        child:  Column(
          children: [
            Container(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Theo giá",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        controller.expand();
                      },
                      iconSize: 20,
                      icon: AnimatedBuilder(
                        animation: controller.expandPriceController,
                        builder: (context, child){
                          return Transform.rotate(angle: controller.animationRotale.value, child: Icon(Icons.keyboard_arrow_down_outlined,) );
                        },
                      )
                  )
                ],
              ),
            ),
            SizeTransition(
              sizeFactor: controller.animationPrice,
              child: Padding(
                padding: EdgeInsets.only(left: 5.0.w),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Obx((){
                          bool is_high_price = controller.is_high_price.value;
                          return Row(
                            children: [
                              ElevatedButton(
                                child: Text("Giá cao",
                                  style: TextStyle(
                                      color: is_high_price ? Colors.white: AppColors.textGrayColor
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: is_high_price ? AppColors.yellowColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),
                                        side: BorderSide(
                                            width: 1,
                                            color: is_high_price ? AppColors.yellowColor: AppColors.textGrayColor
                                        )
                                    )
                                ), onPressed: () {
                                controller.is_high_price.value = ! is_high_price;
                              },
                              ),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                child: Text(
                                  "Giá thấp",
                                  style: TextStyle(
                                      color: !is_high_price ? Colors.white: AppColors.textGrayColor
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: is_high_price ? Colors.white : AppColors.yellowColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                                    side: BorderSide(
                                        width: 1,
                                        color: !is_high_price ? AppColors.yellowColor: AppColors.textGrayColor
                                    )
                                ),
                                onPressed: () {
                                  controller.is_high_price.value = ! is_high_price;
                                },
                              ),
                            ],
                          );
                        })
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0.h),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  const Text("Từ "),

                                  Container(
                                    width: 120.w,
                                    height: 30,
                                    padding: EdgeInsets.only(left: 5.0.w),
                                    child: Obx(()=>
                                        TextFormField(
                                            controller: controller.price_min_text,
                                            cursorColor: AppColors.yellowColor,
                                            keyboardType: TextInputType.number,

                                            textAlignVertical: TextAlignVertical.center,
                                            style: TextStyle(
                                                color: AppColors.textGrayBoldColor
                                            ),
                                            validator: (value){
                                              if(value == null || value.isEmpty){
                                                return 'Trống';
                                              }
                                              final number = int.tryParse(value);
                                              if(number == null){
                                                return 'Không đúng định dạng';
                                              }
                                              return null;
                                            },

                                            onChanged: (value){
                                              controller.validate_min(value);
                                            },
                                            decoration: InputDecoration(
                                              errorText: controller.price_min_error.value!=""? controller.price_min_error.value:null,
                                              errorStyle: TextStyle(
                                                fontSize: 10,
                                              ),
                                              contentPadding: EdgeInsets.all(5.0),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: AppColors.yellowColor, width: 1.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: Colors.red, width: 1.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(color: AppColors.textGrayColor, width: 1.0),
                                              ),
                                            )
                                        )),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  const Text("Đến "),
                                  Container(
                                    width: 120.w,
                                    height: 30,
                                    padding: EdgeInsets.only(left: 5.0.w),
                                    child: Obx(()=>
                                        TextFormField(
                                          cursorColor: AppColors.yellowColor,
                                          keyboardType: TextInputType.number,
                                          controller:  controller.price_max_text,
                                          textAlignVertical: TextAlignVertical.center,
                                          style: TextStyle(
                                              color: AppColors.textGrayBoldColor
                                          ),
                                          decoration: InputDecoration(
                                            errorText: controller.price_max_error.value!=""? controller.price_max_error.value:null,
                                            errorStyle: TextStyle(
                                              fontSize: 10,
                                            ),
                                            contentPadding: EdgeInsets.all(5.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.yellowColor, width: 1.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: AppColors.textGrayColor, width: 1.0),
                                            ),
                                          ),
                                          onChanged: (value){
                                            controller.validate_max(value);
                                          },
                                        )
                                    ),
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
