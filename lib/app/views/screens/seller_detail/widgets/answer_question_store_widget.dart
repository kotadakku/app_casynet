
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../data.dart';
import '../../../theme/app_colors.dart';
import 'card_chat_item.dart';
import 'gift_store_widget.dart';

class AQStoreWidget extends StatelessWidget {
  const AQStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GiftStoreWidget(),
          SizedBox(height: 10,),
          Container(
            color: AppColors.backgroundColor,
            height: 10,
          ),
          ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Container(
              color: AppColors.backgroundColor,
              height: 10,
            ),
            shrinkWrap: true,
            itemBuilder: (context, index)=>
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: IntrinsicHeight(
                      child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          child: Image.asset("assets/images/product_detail/product_1.png"),
                        ),
                        SizedBox(width: 10.w,),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Máy rửa xe Catorex - CTRádasdasdasdasdsadsa" ,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text("1.290.000 đ" , style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),),
                                  SizedBox(width: 10.w,),
                                  Text("1.390.000 đ" , style: TextStyle(
                                      color: AppColors.textGrayBoldColor,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 12
                                  ),),
                                ],
                              )
                            ],
                          )
                        )
                      ],
                    ),
                  )),

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: chats.length,
                  //   itemBuilder: (context, index) => CardChatItem(isFromMe: chats[index]['isMe'], nameUser:  chats[index]['user_name'], message:  chats[index]['content'], time: '', nameCompany: '',)
                  // ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(5.0),
                                hintText: 'enter_question'.tr,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.yellowColor
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.textGrayColor
                                    )
                                ),
                              ),
                            ),
                          )
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.send, color: AppColors.textGrayColor,),
                        )

                      ],
                    ),
                  )
                ],
              ), itemCount: 6,
          )
        ],
      ),
    );
  }
}


