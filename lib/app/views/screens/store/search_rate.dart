import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../app/views/theme/app_colors.dart';
import '../theme/app_colors.dart';
class SearchRate extends StatelessWidget {
  const SearchRate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tìm kiếm đánh giá",),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Container(
                    margin: EdgeInsets.only(right: 10.0.w),
                    child: Text("Tên sản phẩm",
                        style: TextStyle(
                            color: Color.fromARGB(
                                255, 127, 141, 171)))),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // suffixIcon: Icon(Icons.navigate_next),

                      hintText: 'Nhập tên sản phẩm',
                      hintStyle: TextStyle(color: kTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Container(
                    margin: EdgeInsets.only(right: 10.0.w),
                    child: Text("Người mua",
                        style: TextStyle(
                            color: Color.fromARGB(
                                255, 127, 141, 171)))),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // suffixIcon: Icon(Icons.navigate_next),

                      hintText: 'Nhập tên đăng nhập',
                      hintStyle: TextStyle(color: kTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Container(
                    margin: EdgeInsets.only(right: 10.0.w),
                    child: Text("Phân loại hàng",
                        style: TextStyle(
                            color: Color.fromARGB(
                                255, 127, 141, 171)))),
                Expanded(
                  child: TextField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      // suffixIcon: Icon(Icons.navigate_next),

                      hintText: 'Nhập tên phân loại hàng',
                      hintStyle: TextStyle(color: kTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.h,
          ),
          Container(
              margin:
              EdgeInsets.only(left: 10.0.w, right: 10.0.w),
              height: 50.0,
              child: InkWell(
                splashColor: const Color.fromARGB(255, 188, 195, 216),
                onTap: () {},
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("Thời gian đánh giá",
                                style: TextStyle(
                                    color: Color.fromARGB(
                                        255, 127, 141, 171)))
                          ],
                        )),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Thiết lập",style: TextStyle(color: kTextColor),),
                            Icon(Icons.navigate_next,color: kTextColor,),
                          ],
                        ))
                  ],
                ),
              )),
          Container(
            height: 10.h,
            color: const Color.fromARGB(255, 241, 243, 253),
          ),
          Container(

            height: 50.h,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 10.0.h),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.only(left: 80, right: 80),
                backgroundColor: Color.fromARGB(255, 223, 180, 0),
                primary: Colors.white,
                textStyle: const TextStyle(fontSize: 20),
              ),
              // sự kiện chuyển màn
              onPressed: () {},
              child: const Text(
                'Tìm kiếm đánh giá',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
