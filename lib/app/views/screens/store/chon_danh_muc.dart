
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'themsanphamdichvu.dart';

class ChonDanhMuc extends StatelessWidget {
  const ChonDanhMuc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var chonDanhMuc = "".obs;
    final ChonDanhMucController controller = Get.put(ChonDanhMucController());

    return  Scaffold(
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
          "Chọn danh mục",
          // style: TextStyle(fontSize: 17, color: Colors.black),
        ),
        actions:  [

        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Divider(
              height: 3.h,
            ),
            InkWell(
              splashColor: const Color.fromARGB(255, 188, 195, 216),
              // splashColor: Colors.blue,
              onTap: () {
                controller.chonDanhmuc.value = "Rửa xe, thay dầu";
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0.w,
                          height: 30.0.h,
                          margin: EdgeInsets.only(right: 5.0.w),
                          child: Image.asset("assets/store/ic_ruaxe.png"),
                        ),
                        Text("Rửa xe, thay dầu",
                            style: TextStyle(
                                fontSize: 15, color: Colors.black)),
//
                      ],
                    ),
                    const Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
            ),
            InkWell(
              splashColor: const Color.fromARGB(255, 188, 195, 216),

              onTap: () {
                controller.chonDanhmuc.value = "Sửa chữa xe";
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0.w,
                          height: 30.0.h,
                          margin: EdgeInsets.only(right: 5.0.w),

                          child: Image.asset("assets/store/ic_suachua.png"),
                        ),
                        const Text("Sửa chữa xe",
                            style:
                            TextStyle(fontSize: 15, color: Colors.black))
//
                      ],
                    ),
                    const Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
            ),
            InkWell(
              splashColor: const Color.fromARGB(255, 188, 195, 216),

              onTap: () {
                controller.chonDanhmuc.value = "Đồ chơi, phụ kiện xe";
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0.w,
                          height: 30.0.h,
                          margin: EdgeInsets.only(right: 5.0.w),
                          child: Image.asset("assets/store/ic_dochoi.png"),
                        ),
                        const Text("Đồ chơi, phụ kiện xe",
                            style:
                            TextStyle(fontSize: 15, color: Colors.black))
//
                      ],
                    ),
                    const Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
            ),
            InkWell(
              splashColor: const Color.fromARGB(255, 188, 195, 216),
              onTap: () {
                controller.chonDanhmuc.value = "Mua bán xe";
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0.w,
                          height: 30.0.h,
                          margin: EdgeInsets.only(right: 5.0.w),

                          child: Image.asset("assets/store/ic_muabanxe.png"),
                        ),
                        const Text("Mua bán xe",
                            style:
                            TextStyle(fontSize: 15, color: Colors.black))
//
                      ],
                    ),
                    const Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
            ),
            InkWell(
              splashColor: const Color.fromARGB(255, 188, 195, 216),

              onTap: () {
                controller.chonDanhmuc.value = "Chăm sóc xe";
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0.w,
                          height: 30.0.h,
                          margin: EdgeInsets.only(right: 5.0.w),
                          child: Image.asset("assets/store/ic_chamsocxe.png"),
                        ),
                        const Text("Chăm sóc xe",
                            style:
                            TextStyle(fontSize: 15, color: Colors.black))
//
                      ],
                    ),
                    const Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            Divider(
              height: 5.h,
            ),
            InkWell(
              splashColor: const Color.fromARGB(255, 188, 195, 216),
              // splashColor: Colors.blue,
              onTap: () {
                controller.chonDanhmuc.value = "Lốp và ắc quy xe";
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(left: 10.0.w, right: 10.0.w),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 30.0.w,
                          height: 30.0.h,
                          margin: EdgeInsets.only(right: 5.0.w),

                          child: Image.asset("assets/store/ic_lop.png"),
                        ),
                        const Text("Lốp và ắc quy xe",
                            style:
                            TextStyle(fontSize: 15, color: Colors.black))
//
                      ],
                    ),
                    const Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
            ),
          ],
        ),
      ),

    );
  }


}
