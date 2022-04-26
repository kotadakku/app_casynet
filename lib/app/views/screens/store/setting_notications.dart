
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../theme/app_colors.dart';

class SettingNotications extends StatelessWidget {
  const SettingNotications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ],
          ),
        ),
        title: Align(
          alignment: Alignment.center,
          child: const Text(
            "Cài đăt thông báo",
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 3.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 40.0.w,height: 40.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Thông báo Email",style: TextStyle(fontWeight: FontWeight.bold),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(onPressed: (){}, child: Text("Bỏ Email", style: TextStyle(color: Colors.black),))
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Cập nhật đơn hàng",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                      value: true, onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Tin tức",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: false,
                          onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Thông báo cửa hàng",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: true,
                          onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Nội dung cá nhân",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: false,
                          onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Container(height: 20.0.h,color: Color.fromARGB(255, 241, 243, 253),),

            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 40.0.w,height: 40.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Thông báo",style: TextStyle(fontWeight: FontWeight.bold),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(onPressed: (){}, child: Text("Bỏ thông báo", style: TextStyle(color: Colors.black),))
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Cập nhật đơn hàng",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: true, onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Tin nhắn",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: false,
                          onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Khuyến mãi Casynet",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: true,
                          onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Theo dõi bình luận",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: false,
                          onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Divider(
              height: 1.0.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 30.0.w,height: 30.0.h,child: Image.asset("assets/store/ic_thongbao_email.png",),),
                  SizedBox(width: 10.0.w,),
                  Text("Sản phẩm hết hàng",style: TextStyle(color: kTextColor),),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Switch.adaptive(
                          activeColor: Colors.white,
                          activeTrackColor: Colors.green,
                          value: false,
                          onChanged: (value) {})
                    ],
                  ))
                ],
              ),
            ),
            Container(height: 10.0.h,color: Color.fromARGB(255, 241, 243, 253),),

          ],
        ),
      ),
    );
  }
}
