
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_sizes.dart';
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
            color: kBackgroundColor,
            height: 10,
          ),
          ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => Container(
              color: kBackgroundColor,
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
                                      color: kTextColor_gray,
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

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: chats.length,
                    itemBuilder: (context, index) => CardChatItem(isFromMe: chats[index]['isMe'], nameUser:  chats[index]['user_name'], message:  chats[index]['content'])
                  ),

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
                                hintText: "Đặt câu hỏi cho sản phẩm",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kYellowColor
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: kTextColor
                                    )
                                ),
                              ),
                            ),
                          )
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          child: Icon(Icons.send, color: kTextColor,),
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

class CardChatItem extends StatelessWidget {
  final bool isFromMe;
  final String nameUser;
  final String message;
  const CardChatItem({Key? key, isMe, required this.isFromMe, required this.nameUser, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 30.w, top: 10.h, bottom: 10.h),
      margin: EdgeInsets.only(left: isFromMe ? 30 : 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
        color: isFromMe ? Colors.blue.withOpacity(.1) : Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/account/image_user.png"),
                  fit: BoxFit.fill,
                )
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    child: Text(nameUser, style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.blue,
                        // fontWeight: FontWeight.w400
                    ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_half_outlined , size: sizeIcon.width, color: kYellowColor,),
                        ],
                      ),
                      SizedBox(width: 10.w,),
                      Text("10:30 03/30/2020",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize: 12
                        ),

                      )
                    ],
                  ),

                  SizedBox(height: 10.h,),
                  Text(message)
                ],
              ))
        ],
      ),
    );
  }
}
