
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../controller/detail_product_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';

class InformationProductWidget extends StatelessWidget {
  DetailProductController controller;
  InformationProductWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = "".obs;
    TextEditingController date_controller = TextEditingController();
    TextEditingController hours_controller = TextEditingController();
    TextEditingController note_controller = TextEditingController();

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
              Text("${controller.product.value.officialPrice ?? 'Liên hệ'}",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              ),
              SizedBox(width: 5,),
              Text('${controller.product.value.price ?? ''}',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: kTextColor_gray,
                  fontSize: 13,
                  decoration: TextDecoration.lineThrough
                ),
              ),
              Text('       ${controller.product.value.saleoff ?? ''}',style: TextStyle(
                color: kTextColor_gray,
                fontSize: 13,
              ),)
            ],
          ),

          Divider(color: kTextColor,),
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
                        color: kTextColor_gray
                    ),)
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.warning, color: kYellowColor, size: sizeIcon.width),
                    ),
                    Text("Báo xấu: ",
                      style: TextStyle(
                        color: kTextColor_gray
                    ),),
                    Text("${controller.product.value.badReport ?? 0}",
                      style: TextStyle(
                        color: kTextColor_gray,
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
                      child: SvgPicture.asset("assets/images/product_detail/cart2.svg", width: sizeIcon.width,),
                    ),
                    Text("${controller.product.value.sold ?? 0} ",
                        style: TextStyle(
                        color: kTextColor_gray,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    Text("đã bán", style: TextStyle(
                        color: kTextColor_gray
                      ),
                    ),

                  ],
                )

              ],
            ),
          ),
          Divider(color: kTextColor,),
          SizedBox(height: 10,),
          Row(
            children: [
              SvgPicture.asset("assets/images/product_detail/gift.svg", width: sizeIcon.width),
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
                                    color: kYellowColor,
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
                                    color: kYellowColor,
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
              SvgPicture.asset("assets/images/product_detail/coin.svg", width: sizeIcon.width),
              SizedBox(width: 5,),
              Text("Mua hàng và tích "),
              Text('${controller.product.value.coinPoint ?? 0}', style: TextStyle(
                color: kYellowColor,
                fontWeight: FontWeight.bold
              ),),
              Text("Casycoin", style: TextStyle(
                color: kTextColor
              ),),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Icon(Icons.help, color: Colors.blue, size: sizeIcon.width,),
              )
            ],
          ),
          SizedBox(height: 10,),
          //Yeu cau hen truoc
          Container(
            color: kBackgroundColor,
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
                                      controller: date_controller,
                                      readOnly: true,
                                      style: TextStyle(
                                        color: kTextColor_gray,
                                        fontSize: 13,
                                      ),
                                      decoration: InputDecoration(

                                        contentPadding: EdgeInsets.all(5.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: kYellowColor, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: kTextColor, width: 1.0),
                                        ),
                                        suffixIcon: GestureDetector(
                                          behavior: HitTestBehavior.translucent,
                                          onTap: (){
                                            DatePicker.showDatePicker(context,
                                                showTitleActions: true,
                                                minTime: DateTime.now(),
                                                maxTime: DateTime.now().add(Duration(days: 100)),
                                                onChanged: (date) {
                                                },
                                                onConfirm: (value) {
                                                  date.value = DateFormat('yyyy/MM/dd').format(value).toString();
                                                  date_controller.text = date.value;
                                                },
                                                currentTime: DateTime.now(),
                                                locale: LocaleType.vi);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            child: SvgPicture.asset(
                                              'assets/images/product_detail/calendar-alt.svg',
                                              height: 14,
                                              color: kTextColor,
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
                                    controller: hours_controller,
                                    style: TextStyle(
                                      color: kTextColor_gray,
                                      fontSize: 13,
                                    ),
                                    cursorColor: kYellowColor,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(5.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: kYellowColor, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                                      ),
                                      suffixIcon: GestureDetector(
                                        behavior: HitTestBehavior.translucent,
                                        onTap: (){
                                          DatePicker.showTimePicker(context,
                                              showTitleActions: true,
                                              onChanged: (hours) {
                                              },
                                              onConfirm: (hours) {
                                                hours_controller.text = DateFormat('hh:mm').format(hours).toString();
                                              },
                                              currentTime: DateTime.now(),
                                              locale: LocaleType.en);
                                        },
                                        child: Container(
                                            padding: EdgeInsets.all(5.0),
                                            child: SvgPicture.asset(
                                              'assets/images/product_detail/ic_alarm.svg',
                                              height: 14,
                                              color: kTextColor,
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
                                controller: note_controller,
                                cursorColor: kYellowColor,
                                style: TextStyle(
                                  color: kTextColor_gray
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kYellowColor, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kTextColor, width: 1.0),
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
                              Icon(Icons.map_outlined, color: kYellowColor, size: sizeIcon.width,),
                              SizedBox(width: 5,),
                              Text("Bản đồ",
                                style: TextStyle(

                                    color: kYellowColor
                                ),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            onPrimary: kYellowColor,
                            primary: Colors.white,
                            side: BorderSide(color: kYellowColor),
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
                                    color: kYellowColor
                                ),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.white,
                            onPrimary: kYellowColor,
                            side: const BorderSide(color: kYellowColor),
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
