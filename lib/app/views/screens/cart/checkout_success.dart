
import 'package:app_casynet/app/views/widgets/appbar/appbar_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class CheckOutSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarCartWidget(),
        body: SafeArea(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Column(
                  children: [
// Thông tin giao hàng
                    Container(
                      margin: EdgeInsets.only(top: 1.0),
                      alignment: Alignment(0, 0),
                      color: Color.fromARGB(255, 241, 243, 253),
                      height: 50,
                      padding: EdgeInsets.only(left: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Đặt hàng thành công",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/cart/img_mask_group_18.png",
                      width: 150,
                      height: 150,
                    ),
                    Container(

                      child: Text(
                        "Cảm ơn bạn đã đặt hàng!",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 247, 91, 76)),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      child: Text(
                        "Mã số đơn hàng của bạn là:",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 34, 34, 34)),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      child: Text(
                        "0000068",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 223, 180, 0)),
                      ),
                    ),
                    SizedBox(height: 25.0,),
                    Container(
                      child: Text(
                        "Vui lòng chờ xác nhận từ cửa hàng",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 102, 102, 102)),
                      ),
                    ),
                    SizedBox(height: 20.0,),
//btn Tiếp tục mua sắm
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          height: 50,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              backgroundColor: Color.fromARGB(255, 223, 180, 0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.HOME);
                            },
                            child: const Text(
                              'TIẾP TỤC MUA SẮM',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
//btn CHI TIẾT ĐƠN HÀNG
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          height: 50,
                          child: OutlinedButton(

                            style: OutlinedButton.styleFrom(
                              side: BorderSide(width: 1.0, color: Color.fromARGB(255, 223, 180, 0)),
                              padding: EdgeInsets.only(left: 50, right: 50),
                              backgroundColor: Color.fromARGB(255, 255, 255, 255),
                              primary: Color.fromARGB(255, 223, 180, 0),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                            onPressed: () {

                            },
                            child: const Text(
                              'CHI TIẾT ĐƠN HÀNG',
                              style: TextStyle(
                                color: Color.fromARGB(255, 223, 180, 0),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
