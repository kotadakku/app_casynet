
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/store/datetime_range_controller.dart';
class QuanLyDoanhThu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateTimeRangeController QLDTController =
        Get.put(DateTimeRangeController());
    var open_hours = "Thiết lập".obs;
    var close_hours = "Thiết lập".obs;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){Get.back();},
          child: Icon(Icons.arrow_back),
        ),
        title: Text("Quản lý doanh thu"),
        actions: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 5),
            child: GestureDetector(
              onTap: () {
                print("1234");
                // Get.off(NewCreatedStore());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/bottom_navi_icon/noti.svg",
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: GestureDetector(
              onTap: () {
                // Get.off(NewCreatedStore());
                print("kkkS");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ImageIcon(
                    AssetImage("assets/images/store/ic_question_circle.png"),
                    size: 20,
                  )
                ],
              ),
            ),
          )
        ],

      ),
      body: SafeArea(
        child: Column(
          children: [
            /*Container(
                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_back),
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
                            "Quản lý doanh thu",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 10,right: 5),
                      child: GestureDetector(
                        onTap: () {
                          print("1234");
                          // Get.off(NewCreatedStore());
                        },
                        // splashColor: Colors.black26,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/bottom_navi_icon/noti.svg",
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 10,right: 5),
                      child: GestureDetector(
                        onTap: () {
                          // Get.off(NewCreatedStore());
                          print("kkkS");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/store/ic_question_circle.png"),
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),*/
            Divider(thickness: 5,),
            Expanded(
                child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Color.fromARGB(255, 223, 180, 0),
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Color.fromARGB(255, 223, 180, 0),
                          tabs: [
                            Tab(
                              child: Text("Doanh số"),
                            ),
                            Tab(
                              child: Text("Tổng đơn hàng"),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.0),
                                    height: 80.0,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                            "assets/images/store/img_money.png"),
                                        Text(
                                          "24.000.000",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 221, 22, 22),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("nvđ",
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 221, 22, 22),
                                              fontSize: 15,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: Color.fromARGB(255, 241, 243, 253),
                                    padding: EdgeInsets.all(10.0),
                                    height: 70.0,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(
                                              () => Text(
                                            "Từ : " +
                                                DateFormat("dd/MM/yyyy")
                                                    .format(QLDTController
                                                    .dateRange
                                                    .value
                                                    .start)
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Obx(
                                              () => Text(
                                            "Đến : " +
                                                DateFormat("dd/MM/yyyy")
                                                    .format(QLDTController
                                                    .dateRange
                                                    .value
                                                    .end)
                                                    .toString(),
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Color.fromARGB(
                                              255, 188, 195, 216),
                                          onTap: () {
                                            QLDTController.chooseDateRangePicker();
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.filter_alt_outlined),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),
                                  Expanded(child: ListView(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        height: 80.0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Lốp xe ô tô", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
                                                Text("5.000.000 vnđ", style: TextStyle(fontWeight: FontWeight.w300),),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text("Xem chi tiết", style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 3,),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        height: 80.0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Lốp xe ô tô", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
                                                Text("5.000.000 vnđ", style: TextStyle(fontWeight: FontWeight.w300),),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text("Xem chi tiết", style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 3,),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        height: 80.0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Lốp xe ô tô", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
                                                Text("5.000.000 vnđ", style: TextStyle(fontWeight: FontWeight.w300),),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text("Xem chi tiết", style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 3,),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        height: 80.0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Lốp xe ô tô", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
                                                Text("5.000.000 vnđ", style: TextStyle(fontWeight: FontWeight.w300),),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text("Xem chi tiết", style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 3,),
                                      Container(
                                        padding: EdgeInsets.all(10.0),
                                        height: 80.0,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Lốp xe ô tô", style: TextStyle(fontWeight: FontWeight.w800,fontSize: 15),),
                                                Text("5.000.000 vnđ", style: TextStyle(fontWeight: FontWeight.w300),),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text("Xem chi tiết", style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(thickness: 3,),
                                    ],
                                  ))
                                ],
                              ),
                              Text("3434343"),
                            ],
                          ),
                        ),
                      ],
                    ))),

          ],
        ),
      ),
    );
  }
}
