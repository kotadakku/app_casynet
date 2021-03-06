
import 'package:app_casynet/app/controller/store_detail/detail_store_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';

class GiftStoreWidget extends StatelessWidget {
  GiftStoreWidget({Key? key}) : super(key: key);
  DetailStoreController _detailStoreController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 15.h, left: 0.w, bottom: 15.h),
          child: Text('gift_seller'.tr,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          child: Wrap(
            spacing: 10.w,
            alignment: WrapAlignment.center,
            runSpacing: 10,
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: 0.5.sw-15,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColors.textGrayColor)
                ),
                child: Row(
                  children: [
                    Expanded(flex: 2 ,child: Container(
                      padding: EdgeInsets.all(5.0) ,
                      child: SvgPicture.asset("assets/images/seller_detail/gift.svg", width: 30,),
                    )),
                    Expanded(flex: 5 ,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Giảm 410k đơn tối thiểu 370",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2.0,),
                        Text("${'expire'.tr}: 14/04/2020",
                          style: TextStyle(
                              color: AppColors.textGrayColor, fontSize: 10
                          ),)
                      ],
                    ),),
                    Expanded(flex: 2, child:
                    GestureDetector(
                      onTap: (){
                        _detailStoreController.addVoucher(1); // pass id voucher
                        Get.toNamed(Routes.ACCOUNT_WALLET_VOUCHER);

                      },
                      child: Stack(
                        children: [
                          SvgPicture.asset("assets/images/seller_detail/right.svg",),
                          Positioned.fill(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: Text("Nhận",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12
                                      ),

                                    ),
                                  )
                              )
                          ),

                        ],
                      ),
                    )


                    )
                  ],

                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: 0.5.sw-15,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColors.textGrayColor)
                ),
                child: Row(
                  children: [
                    Expanded(flex: 2 ,child: Container(
                      padding: EdgeInsets.all(5.0) ,
                      child: SvgPicture.asset("assets/images/seller_detail/gift.svg", width: 30,),
                    )),
                    Expanded(flex: 5 ,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Giảm 410k đơn tối thiểu 370",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2.0,),
                        Text("${'expire'.tr}: 14/04/2020",
                          style: TextStyle(
                              color: AppColors.textGrayColor, fontSize: 10
                          ),)
                      ],
                    ),),
                    Expanded(flex: 2, child: Stack(
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset("assets/images/seller_detail/right.svg",),
                          onTap: (){
                            Get.toNamed(Routes.ACCOUNT_WALLET_VOUCHER);
                          },
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: Text("Nhận",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12
                                    ),

                                  ),
                                )
                            ))
                      ],
                    ))
                  ],

                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: 0.5.sw-15,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColors.textGrayColor)
                ),
                child: Row(
                  children: [
                    Expanded(flex: 2 ,child: Container(
                      padding: EdgeInsets.all(5.0) ,
                      child: SvgPicture.asset("assets/images/seller_detail/gift.svg", width: 30,),
                    )),
                    Expanded(flex: 5 ,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Giảm 410k đơn tối thiểu 370",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2.0,),
                        Text("${'expire'.tr}: 14/04/2020",
                          style: TextStyle(
                              color: AppColors.textGrayColor, fontSize: 10
                          ),)
                      ],
                    ),),
                    Expanded(flex: 2, child: Stack(
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset("assets/images/seller_detail/right.svg",),
                          onTap: (){
                            Get.toNamed(Routes.ACCOUNT_WALLET_VOUCHER);
                          },
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: Text("Nhận",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12
                                    ),

                                  ),
                                )
                            ))
                      ],
                    ))
                  ],

                ),
              ),
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: 0.5.sw-15,
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: AppColors.textGrayColor)
                ),
                child: Row(
                  children: [
                    Expanded(flex: 2 ,child: Container(
                      padding: EdgeInsets.all(5.0) ,
                      child: SvgPicture.asset("assets/images/seller_detail/gift.svg", width: 30,),
                    )),
                    Expanded(flex: 5 ,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Giảm 410k đơn tối thiểu 370",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 2.0,),
                        Text("${'expire'.tr}: 14/04/2020",
                          style: TextStyle(
                              color: AppColors.textGrayColor, fontSize: 10
                          ),)
                      ],
                    ),),
                    Expanded(flex: 2, child: Stack(
                      children: [
                        GestureDetector(
                          child: SvgPicture.asset("assets/images/seller_detail/right.svg",),
                          onTap: (){
                            Get.toNamed(Routes.ACCOUNT_WALLET_VOUCHER);
                          },
                        ),
                        Positioned.fill(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 2.w),
                                  child: Text("Nhận",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12
                                    ),

                                  ),
                                )
                            ))
                      ],
                    ))
                  ],

                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
