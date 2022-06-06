
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../theme/app_colors.dart';
class QuestionAnswer extends StatelessWidget {
  const QuestionAnswer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('qa'.tr,),
      ),
      body: Column(
        children: [
          Divider(height: 3.0.h,),
          Container(
            height: 55,
            color: AppColors.backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: TextField(
              cursorColor: AppColors.textGrayColor,
              onTap: (){

              },

              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusColor: AppColors.yellowColor,
                contentPadding: EdgeInsets.all(5.0),
                prefixIcon: Icon(Icons.search),
                hintText: "Tìm kiếm hỏi đáp",
                hintStyle: TextStyle(
                    color: AppColors.textGrayBoldColor
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: BorderSide(
                        color: AppColors.textGrayColor,
                        width: 1.0
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: BorderSide(
                        color: AppColors.yellowColor,
                        width: 1.0
                    )
                ),
              ),

            ),
          ),
          Expanded(
              child: DefaultTabController(
                  length: 3,
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
                                    width: MediaQuery.of(context).size.width,
                                    child: TabBar(
                                      labelColor: Color.fromARGB(255, 223, 180, 0),
                                      unselectedLabelColor: Colors.grey,
                                      indicatorColor: Color.fromARGB(255, 223, 180, 0),
                                      tabs: [
                                        Tab(
                                          child: Text('all'.tr),
                                        ),
                                        Tab(
                                          child: Text("Chưa trả lời"),
                                        ),
                                        Tab(
                                          child: Text("Đã trả lời"),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],),
                            ],
                          )
                      ),
                      /*Expanded(
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
                                          "100 đơn",
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

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
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

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
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

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
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

                                                Text("mã đơn: 000001", style: TextStyle(fontWeight: FontWeight.w100),),
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
                        ),*/
                    ],
                  ))),
        ],
      ),


    );
  }
}
