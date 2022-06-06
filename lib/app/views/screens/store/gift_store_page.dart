
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import 'new_promotion.dart';

class GiftStorePage extends StatelessWidget {
  const GiftStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('gift_seller'.tr),
        actions: [
          InkWell(
            onTap: (){
              Get.to(NewPromotionPage());
            },
            child: Container(margin: EdgeInsets.only(right: 10.0.w),
            child: Icon(CupertinoIcons.add_circled, ),)
          )

        ],
      ),
      body: Column(
        children: [
          Container(
            height: 55,
            color: AppColors.backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
            child: TextField(
              cursorColor: AppColors.textGrayColor,

              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                focusColor: AppColors.yellowColor,
                contentPadding: EdgeInsets.all(5.0),
                prefixIcon: Icon(Icons.search),
                hintText: "Tìm chương trình khuyến mãi",
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
                  TabBar(
                    labelColor: AppColors.yellowColor,
                    indicatorColor: AppColors.yellowColor,
                    unselectedLabelColor: AppColors.textGrayColor,
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
                                          color: AppColors.textGrayColor,
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
                                                      color: AppColors.textGrayColor,
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
                                                          Text('share'.tr,
                                                            style: TextStyle(
                                                                color: AppColors.textGrayColor
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: AppColors.textGrayColor,
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
                                                      color: AppColors.textGrayColor,
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
                                                          Text('edit'.tr,
                                                            style: TextStyle(
                                                                color: AppColors.textGrayColor
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: AppColors.textGrayColor,
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
                                                      color: AppColors.textGrayColor,
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
                                                          Text('delete'.tr,
                                                            style: TextStyle(
                                                                color: AppColors.textGrayColor
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: AppColors.textGrayColor,
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
                                        child: SvgPicture.asset("assets/images/product_detail/gift.svg"),
                                      ),
                                      Text("Mã quà tặng: 00000001",
                                        style: TextStyle(
                                            color: AppColors.textGrayColor
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
                                            color: AppColors.textGrayColor
                                        ),
                                      ),
                                      SizedBox(width: 20.w,),
                                      Text("Kết thúc: 17/03/2020",
                                        style: TextStyle(
                                            color: AppColors.textGrayColor
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
