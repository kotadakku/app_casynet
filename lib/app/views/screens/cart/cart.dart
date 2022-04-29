
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/bottom_nav_controller.dart';
import '../product_detail/widgets/top_detail_product_widget.dart';
import 'cart2.dart';
import 'itemCart.dart';

class Cart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        flexibleSpace: const TopDetailProductWidget(),
      ),
      body: Material(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                //giỏ hang của bạn
                Container(
                  alignment: Alignment(0, 0),
                  color: Color.fromARGB(255, 241, 243, 253),
                  height: 50.h,
                  padding: EdgeInsets.only(left: 5.w),
                  child: Row(
                    children: [
                      GetBuilder<BottomNavController>(
                          init: BottomNavController(),builder: (controller)=>InkWell(
                        splashColor: Colors.blue,
                        child: Icon(Icons.arrow_back),/*Center(child: ),*/
                        onTap: (){
                          controller.changeTabIndex(0);
                        },
                      ),),
                      const Text(
                        "Giỏ Hàng Của Bạn ",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    Container(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return ItemCart();
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 30.h,
                            thickness: 0.5,
                          );
                        },
                        padding: EdgeInsets.all(0.1.h),
                        itemCount: 2,
                        shrinkWrap: true,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 50.h,
                            alignment: AlignmentDirectional.centerStart,
                            child: Stack(
                              // alignment: const Alignment(-0.5, 1),
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Image.asset(
                                    "assets/cart/img_sale.png",
                                    width: 70.h,
                                    height: 40.h,
                                  ),
                                ),
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    "SALE",
                                    style: TextStyle(
                                        color: Color.fromARGB(193, 193, 115, 10),
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 50,
                            alignment: AlignmentDirectional.centerStart,
                            child: TextField(
                              keyboardType: TextInputType.text,
                              textAlign: TextAlign.left,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Mã giảm giá',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2.0,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(right: 2.0),
                              height: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.all(2.5),
                                  backgroundColor:
                                  Color.fromARGB(255, 4, 119, 233),
                                  primary: Colors.white,
                                  textStyle: const TextStyle(fontSize: 15),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Áp dụng',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                            )),
                      ],
                    ),
                    // thành tiền
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40.0,
                                  margin: EdgeInsets.only(left: 5.0,top: 10.0),
                                  child: Text(
                                    "Thành tiền: ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 149, 156, 175),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 40.0,
                                      margin: EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        "10.000.000 đ ",
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 255, 69, 69),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 20,
                              margin: EdgeInsets.only(right: 5.0),
                              child: Text(
                                "(Đã bao gồm VAT nếu có) ",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 149, 156, 175),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
// button tiến hành đặt hàng
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(5.0),
                          height: 50,
                          child: TextButton(

                            style: TextButton.styleFrom(

                              padding: EdgeInsets.only(left: 80,right: 80),
                              backgroundColor:
                              Color.fromARGB(255, 223, 180, 0),
                              primary: Colors.white,
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            // sự kiện chuyển màn
                            onPressed: () {

                              Get.to(Cart2());
                            },
                            child: const Text(
                              'Tiến hành đặt hàng',
                              style: TextStyle(fontWeight: FontWeight.w500,),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),

    );
  }
}
