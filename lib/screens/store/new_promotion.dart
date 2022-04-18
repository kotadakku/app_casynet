
import 'package:app_casynet/screens/account/address/edit_address.dart';
import 'package:app_casynet/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NewPromotionPage extends StatelessWidget {
  const NewPromotionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){
            Get.back();
          },
        ),
        title: Text("Tạo chương trình khuyến mãi",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        actions: [

        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
            color: kBackgroundColor,
            width: ScreenUtil().screenWidth,
            child: Text("Thông tin khuyến mãi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          TextField(
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              color: kTextColor,
              fontSize: 15,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              hintText: "Nhập tên chương trình khuyến mãi",
              hintStyle: TextStyle(
                color: kTextColor
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kYellowColor
                )
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: kTextColor
                  )
              ),
              suffixIcon: Icon(Icons.edit_outlined, color: kTextColor,),
            ),
          ),
          Row(
            children: [
              Container(
                height: 25,
                width: 25,
                padding: EdgeInsets.all(5.0),
                child: SvgPicture.asset("assets/detail_product/gift.svg"),
              ),
              Text("Mã quà tặng"),
              Expanded(child: TextField(
                textAlign: TextAlign.end,
                cursorColor: kTextColor,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: "Nhập mã quà tặng",
                  contentPadding: EdgeInsets.all(10.0),
                  hintStyle: TextStyle(
                    color: kTextColor,
                    fontSize: 15,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                ),
              ))
            ],
          ),
          Container(
            height: 20.h,
            color: kBackgroundColor,
          ),
          Padding(padding: EdgeInsets.only(left: 10.0.w, top: 10.h),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  padding: EdgeInsets.only(right: 5.0),
                  child:  Icon(Icons.calendar_today,
                    size: 15,

                  ),
                ),

                Text("Thời gian khuyến mãi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 20.h,
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Row(
              children: [
                Text("Từ ngày",
                  style: TextStyle(
                      color: kTextColor_gray
                  ),
                ),
                Spacer(),
                Text("Thiết lập",
                  style: TextStyle(
                    color: kTextColor
                  ),
                ),
                Icon(Icons.keyboard_arrow_right_outlined, color: kTextColor, size: 18,)
              ],

            ),
          ),
          Divider(
            height: 20.h,
          ),
          Padding(padding: EdgeInsets.symmetric(
            horizontal: 10.w),
            child: Row(
              children: [
                Text("Đến ngày",
                  style: TextStyle(
                    color: kTextColor_gray
                  ),
                ),
                Spacer(),
                Text("Thiết lập",
                  style: TextStyle(
                      color: kTextColor
                  ),
                ),
                Icon(Icons.keyboard_arrow_right_outlined, color: kTextColor, size: 18,)
              ],

            ),
          ),
          Divider(
            height: 30.h,
            thickness: 10.h,
            color: kBackgroundColor,
          ),
          Container(
            width: ScreenUtil().screenWidth,
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: ElevatedButton(
              onPressed: (){},
              child: Text("Lưu & tiếp tục"),
              style: ElevatedButton.styleFrom(
                primary: kYellowColor,
              )
            ),
          )
        ],
      ),
    );
  }
}
