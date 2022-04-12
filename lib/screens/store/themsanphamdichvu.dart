import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ThemSanPhamDichVu extends StatelessWidget {
  const ThemSanPhamDichVu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
                height: 50.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // margin: EdgeInsets.only(left: 10,right: 5),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.black,

                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // flex: 1,
                      child: SizedBox(),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Thêm sản phẩm/ dịch vụ",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 10,right: 5),
                      child: OutlinedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
                        ),
                        onPressed: () {},
                        child: Text("Lưu",style: TextStyle(color: Colors.black),)
                      ),
                    ),


                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Color.fromARGB(255, 218, 248, 243),
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(

                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
