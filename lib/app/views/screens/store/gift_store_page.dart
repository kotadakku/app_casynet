
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';
import 'new_promotion.dart';

class GiftStorePage extends StatelessWidget {
  const GiftStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: (){
            Get.back();
          },
        ),
        title: Text("Quà tặng cửa hàng",
          style: TextStyle(fontSize: 17,
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.add_circled),
            color: Colors.black,
            onPressed: (){
              Get.to(NewPromotionPage());
            },
          )

        ],
      ),
      body: Column(
        children: [
          Container(
            height: 55,
            color: kBackgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: TextField(
              cursorColor: kTextColor,

              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusColor: kYellowColor,
                contentPadding: EdgeInsets.all(5.0),
                prefixIcon: Icon(Icons.search),
                hintText: "Tìm chương trình khuyến mãi",
                hintStyle: TextStyle(
                  color: kTextColor_gray
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.0),
                  borderSide: BorderSide(
                    color: kTextColor,
                    width: 1.0
                  )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: BorderSide(
                        color: kYellowColor,
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
                  TabBar(
                    labelColor: kYellowColor,
                    indicatorColor: kYellowColor,
                    unselectedLabelColor: kTextColor,
                    tabs: [
                      Tab(
                        child: Text("Sắp diễn ra"),
                      ),
                      Tab(
                        child: Text("Đang diễn ra"),
                      ),
                      Tab(
                        child: Text("Đã kết thúc"),
                      ),

                    ],
                  ),
                  Expanded(child: TabBarView(
                      children: [
                        ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(child: Text("Chương trình giảm giá 50% nhân dịp 8/3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),),
                                      PopupMenuButton(
                                        elevation: 20,
                                        enabled: true,
                                        offset: Offset(30, 30),
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: kTextColor,
                                        ),
                                        onSelected: (value){

                                        },
                                        itemBuilder: (contex){
                                          return [
                                            PopupMenuItem(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(Icons.share_outlined,
                                                      color: kTextColor,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        bottom: 15,
                                                        right: 10
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Chia sẻ",
                                                            style: TextStyle(
                                                                color: kTextColor
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: kTextColor,
                                                            height: 20,
                                                            thickness: 1,
                                                          ),
                                                        ],
                                                      )
                                                  )
                                                ],
                                              ),
                                              value: "share",
                                            ),
                                            PopupMenuItem(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(Icons.edit,
                                                      color: kTextColor,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        bottom: 15,
                                                        right: 10
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Sửa",
                                                            style: TextStyle(
                                                                color: kTextColor
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: kTextColor,
                                                            height: 20,
                                                            thickness: 1,
                                                          ),
                                                        ],
                                                      )
                                                  )
                                                ],
                                              ),
                                              value: "edit",
                                            ),
                                            PopupMenuItem(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(CupertinoIcons.trash,
                                                      color: kTextColor,
                                                    ),
                                                    padding: EdgeInsets.only(
                                                        bottom: 15,
                                                        right: 10
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Xóa",
                                                            style: TextStyle(
                                                                color: kTextColor
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: kTextColor,
                                                            height: 20,
                                                            thickness: 1,
                                                          ),
                                                        ],
                                                      )
                                                  )
                                                ],
                                              ),
                                              value: "share",
                                            ),
                                          ];
                                        }
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        padding: EdgeInsets.all(5.0),
                                        child: SvgPicture.asset("assets/detail_product/gift.svg"),
                                      ),
                                      Text("Mã quà tặng: 00000001",
                                        style: TextStyle(
                                            color: kTextColor
                                        ),

                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 25,
                                        width: 25,
                                        padding: EdgeInsets.all(5.0),
                                        child:  Icon(Icons.calendar_today, size: 15,),
                                      ),

                                      Text("Bắt đầu: 17/03/2020",
                                        style: TextStyle(
                                            color: kTextColor
                                        ),
                                      ),
                                      SizedBox(width: 20.w,),
                                      Text("Kết thúc: 17/03/2020",
                                        style: TextStyle(
                                            color: kTextColor
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index){
                            return Divider();
                          },
                          itemCount: 10,
                        ),
                        Text("1232"),
                        Text("423543")
                      ]
                  ),
                  )
                ],
              ),
            ),
          )
        ],

      ),
    );
  }
}
