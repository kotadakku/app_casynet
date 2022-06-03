
import 'package:app_casynet/app/utlis/int_to_price.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controller/product_detail/detail_product_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';

class InformationProductWidget extends StatelessWidget {
  DetailProductController controller;
  InformationProductWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(controller.product.value.name?? 'Chưa có thông tin',
            style: Theme.of(context).textTheme.titleMedium
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("${IntToPrice(controller.product.value.price ?? controller.product.value.officialPrice??0).intToPrice()} đ",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              ),
              SizedBox(width: 5,),
              if(controller.product.value.officialPrice != null)
              Text('${IntToPrice(controller.product.value.officialPrice).intToPrice()}',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: AppColors.textGrayBoldColor,
                  fontSize: 13,
                  decoration: TextDecoration.lineThrough
                ),
              ),
              if(controller.product.value.officialPrice != null)
              Text('   -${controller.product.value.calSaleOff() ?? 0} %',style: TextStyle(
                color: AppColors.textGrayBoldColor,
                fontSize: 13,
              ),)
            ],
          ),

          Divider(color: AppColors.textGrayColor,),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: controller.product.value.rate??0.0,
                      unratedColor: Colors.amber.withOpacity(0.2),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star_outlined,
                        color: Colors.amber,
                      ),
                      itemCount: 5,
                      itemSize: 18.0,
                      direction: Axis.horizontal,
                    ),
                    SizedBox(width: 5,),
                    Text('${controller.product.value.rate??0.0}', style: TextStyle(
                        color: AppColors.textGrayBoldColor
                    ),)
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.warning, color: AppColors.yellowColor, size: AppSize.iconSize),
                    ),
                    Text("Báo xấu: ",
                      style: TextStyle(
                        color: AppColors.textGrayBoldColor
                    ),),
                    Text("${controller.product.value.badReport ?? 0}",
                      style: TextStyle(
                        color: AppColors.textGrayBoldColor,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      margin: EdgeInsets.all(5.0),
                      child: SvgPicture.asset("assets/images/product_detail/cart2.svg", width: AppSize.iconSize,),
                    ),
                    Text("${controller.product.value.sold ?? 0} ",
                        style: TextStyle(
                        color: AppColors.textGrayBoldColor,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text("đã bán", style: TextStyle(
                        color: AppColors.textGrayBoldColor
                      ),
                    ),

                  ],
                )

              ],
            ),
          ),
          Divider(color: AppColors.textGrayColor,),
          SizedBox(height: 10,),
          Row(
            children: [
              SvgPicture.asset("assets/images/product_detail/gift.svg", width: AppSize.iconSize),
              SizedBox(width: 5,),
              Text("Quà tặng của của hàng: "),
              Container(
                height: 20,
                width: 60,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Stack(
                  children: [
                    Container(
                      height: 20,
                      child: SvgPicture.asset("assets/images/product_detail/back_sale.svg"),
                    ),
                    Positioned.fill(
                        child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Giảm ',
                                style: TextStyle(
                                    color: AppColors.yellowColor,
                                    fontSize: 10
                                ),
                                children:[
                                  TextSpan(text: 'đ ', style: TextStyle(
                                      decoration: TextDecoration.underline
                                  )),
                                  TextSpan(text: '2K')
                                ],
                              ),
                            )
                        )
                    )
                  ],
                ),
              ),
              Container(
                height: 20,
                width: 60,
                child: Stack(
                  children: [
                    Container(
                      height: 20,
                      child: SvgPicture.asset("assets/images/product_detail/back_sale.svg"),
                    ),
                    Positioned.fill(
                        child: Center(
                            child: RichText(
                              text: TextSpan(
                                text: 'Giảm ',
                                style: TextStyle(
                                    color: AppColors.yellowColor,
                                    fontSize: 10
                                ),
                                children:[
                                  TextSpan(text: 'đ ', style: TextStyle(
                                      decoration: TextDecoration.underline
                                  )),
                                  TextSpan(text: '3K')
                                ],
                              ),
                            )
                        )
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SvgPicture.asset("assets/images/product_detail/coin.svg", width: AppSize.iconSize),
              SizedBox(width: 5,),
              Text("Mua hàng và tích "),
              Text('${controller.product.value.coinPoint ?? 0}', style: TextStyle(
                color: AppColors.yellowColor,
                fontWeight: FontWeight.bold
              ),),
              Text("Casycoin", style: TextStyle(
                color: AppColors.textGrayColor
              ),),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Icon(Icons.help, color: Colors.blue, size: AppSize.iconSize,),
              )
            ],
          ),
          SizedBox(height: 10,),
          //Yeu cau hen truoc
          controller.product.value.requiredOptions == 0
              ? SizedBox()
              : Container(
            color: AppColors.backgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Yêu cầu hẹn trước ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  // Ngay
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [

                            Container(
                              width: 60,
                              child: Text("Ngày"),
                            ),
                            Expanded(
                                child: Container(
                                    height: 30,
                                    color: Colors.white,
                                    child: TextField(
                                      controller: controller.date_controller,
                                      focusNode: controller.date_focus,
                                      readOnly: true,
                                      style: TextStyle(
                                        color: AppColors.textGrayBoldColor,
                                        fontSize: 13,
                                      ),
                                      decoration: InputDecoration(

                                        contentPadding: EdgeInsets.all(5.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.yellowColor, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: AppColors.textGrayColor, width: 1.0),
                                        ),
                                        suffixIcon: GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: () async {
                                            final DateTime? value = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now().add(Duration(days: 1)),
                                                firstDate: DateTime.now().add(Duration(days: 1)),
                                                lastDate: DateTime.now().add(Duration(days: 100)),
                                            );
                                            controller.date_controller.text = DateFormat('yyyy-MM-dd').format(value!).toString();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            child: SvgPicture.asset(
                                              'assets/images/product_detail/calendar-alt.svg',
                                              height: 14,
                                              color: AppColors.textGrayColor,
                                            )
                                          ),
                                        ),
                                        suffixIconConstraints: BoxConstraints(
                                          maxWidth: 30,
                                          minHeight: 30,
                                        )
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                      ),
                      Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Text("Giờ"),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  height: 30,
                                  child: TextField(
                                    readOnly: true,
                                    focusNode: controller.hours_focus,
                                    controller: controller.hours_controller,
                                    style: TextStyle(
                                      color: AppColors.textGrayBoldColor,
                                      fontSize: 13,
                                    ),
                                    cursorColor: AppColors.yellowColor,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(5.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.yellowColor, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: AppColors.textGrayColor, width: 1.0),
                                      ),
                                      suffixIcon: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: () async {
                                          TimeOfDay? value = await showTimePicker(
                                              context: context,
                                              builder: (context, childWidget) {
                                                return MediaQuery(
                                                    data: MediaQuery.of(context).copyWith(
                                                      // Using 24-Hour format
                                                        alwaysUse24HourFormat: true),
                                                    // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
                                                    child: childWidget!);
                                              },
                                              initialTime: TimeOfDay.now(),
                                          );
                                          controller.hours_controller.text = '${value?.hour}:${value?.minute}';
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            child: SvgPicture.asset(
                                              'assets/images/product_detail/ic_alarm.svg',
                                              height: 14,
                                              color: AppColors.textGrayColor,
                                            )
                                        ),
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                        maxWidth: 30,
                                        minHeight: 30,
                                      )
                                    ),
                                  )
                                )

                              )
                            ],
                          )
                      )
                    ],

                  ),
                  SizedBox(height: 10,),
                  //Ghi chus
                  Row(
                    children: [
                      Container(
                        width: 60,
                        child: Text("Ghi chú"),
                      ),
                      Expanded(
                          child: Container(
                              color: Colors.white,
                              height: 30,
                              child: TextField(
                                controller: controller.note_controller,
                                cursorColor: AppColors.yellowColor,
                                style: TextStyle(
                                  color: AppColors.textGrayBoldColor
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.yellowColor, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: AppColors.textGrayColor, width: 1.0),
                                  ),
                                ),
                              )
                          )

                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 60,),
                      Flexible(child: Container(
                        height: 30,
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.map_outlined, color: AppColors.yellowColor, size: AppSize.iconSize,),
                              SizedBox(width: 5,),
                              Text("Bản đồ",
                                style: TextStyle(

                                    color: AppColors.yellowColor
                                ),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            onPrimary: AppColors.yellowColor,
                            primary: Colors.white,
                            side: BorderSide(color: AppColors.yellowColor),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                          ), onPressed: () {  },
                        ),
                      ),),
                      SizedBox(width: 10,),
                      Flexible(child:  Container(
                        height: 30,
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                padding: EdgeInsets.all(3.0),
                                child: SvgPicture.asset("assets/images/product_detail/ic_perm_phone.svg"),
                              ),
                              SizedBox(width: 5,),
                              Text("Liên hệ",
                                style: TextStyle(
                                    color: AppColors.yellowColor
                                ),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.white,
                            onPrimary: AppColors.yellowColor,
                            side: const BorderSide(color: AppColors.yellowColor),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.CONTACT);
                          },
                        ),
                      ),),
                    ],
                  ),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
