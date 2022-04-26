<<<<<<< HEAD:lib/app/views/screens/store/news.dart

=======
import 'package:app_casynet/screens/store/new_post.dart';
import 'package:app_casynet/screens/store/search_news.dart';
>>>>>>> 51325907f4ea1b8a7ae08eb376afbe96b6e538ef:lib/screens/store/news.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app/views/theme/app_colors.dart';
import '../theme/app_colors.dart';
import 'new_post.dart';
import 'search_news.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var soLuongHienThi = 30;
    var tongSoLuong = 1000;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "Tin tức",
          // style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        actions: [
          InkWell(
              onTap: (){
                Get.to(NewPost());
              },
              child: Container(margin: EdgeInsets.only(right: 10.0.w),
                child: Icon(CupertinoIcons.add_circled, ),)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 3.0.h,
            ),
            Container(
              height: 55,
              color: kBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
              child: TextField(
                cursorColor: kTextColor,
                onTap: () {
                  Get.to(SearchNews());
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  focusColor: kYellowColor,
                  contentPadding: EdgeInsets.all(5.0),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Tìm kiếm",
                  hintStyle: TextStyle(color: kTextColor_gray),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(color: kTextColor, width: 1.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(color: kYellowColor, width: 1.0)),
                ),
              ),
            ),
            ListView(
              shrinkWrap:true,
              children: [
                Column(
                  children: [
                    Container(
                      height: 50.0.h,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                      child: Row(
                        children: [
                          Text( soLuongHienThi.toString()+ " Sản phẩm", style: TextStyle(fontWeight: FontWeight.w600),),
                          SizedBox(width: 20.0.w,),
                          Container(
                            padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 5.0.h, bottom: 5.0.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.lightBlueAccent)

                            ),
                            child: Text(soLuongHienThi.toString() +"/"+tongSoLuong.toString(), style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.w500,),),
                          )
                        ],
                      ),)
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
