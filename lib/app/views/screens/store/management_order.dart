
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/store/datetime_range_controller.dart';

class OrderManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateTimeRangeController QLDTController =
    Get.put(DateTimeRangeController());

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){Get.back();},
          child: Icon(Icons.arrow_back),
        ),
        title: Text('order_management'.tr),
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
            Expanded(
                child: DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        Container(
                            height: 50.0,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 400,
                                      child: TabBar(
                                        labelColor: Color.fromARGB(255, 223, 180, 0),
                                        unselectedLabelColor: Colors.grey,
                                        indicatorColor: Color.fromARGB(255, 223, 180, 0),
                                        tabs: [
                                          Tab(
                                            child: Text('all'.tr),
                                          ),
                                          Tab(
                                            child: Text('confirming'.tr),
                                          ),
                                          Tab(
                                            child: Text('processed'.tr),
                                          ),
                                          Tab(
                                            child: Text('cancelled'.tr),
                                          ),
                                        ],
                                      ),
                                    ),

                                  ],),
                              ],
                            )
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
                                            "assets/images/store/img_donhang.png"),
                                        Text(
                                          "100 ${'order'.tr}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 223, 180, 0),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),

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
                                            "${'from'.tr} : " +
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
                                            "${'to'.tr} : " +
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

                                                Text("${'code_order'.tr}: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text('view_detail'.tr, style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
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

                                                Text("${'code_order'.tr}: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text('view_detail'.tr, style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
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

                                                Text("${'code_order'.tr}: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text('view_detail'.tr, style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
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

                                                Text("${'code_order'.tr}: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text('view_detail'.tr, style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
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

                                                Text("${'code_order'.tr}: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
                                                InkWell(
                                                  onTap: (){},
                                                  child: Text('view_detail'.tr, style: TextStyle(fontWeight: FontWeight.w300,color: Color.fromARGB(255,0, 85, 170)),),
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
                              Text("3434343"),
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
