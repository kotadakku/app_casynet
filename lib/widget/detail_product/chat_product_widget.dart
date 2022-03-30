import 'package:app_casynet/containts/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatProductWidget extends StatelessWidget {
  const ChatProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hỏi đáp",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
              Text("1000 hỏi đáp",
              style: TextStyle(
                  color: kTextColor
              ),)
            ],
          ),
        ),
        Divider(
          height: 10,
          color: kTextColor,
        ),
        Column(
          children: [
            CardChatItem(isFromMe: true,
              nameCompany: "ngocbich85hd",
              message: "Bạn giới thiệu về sản phẩm được không ạ?"
            ),
            CardChatItem(
              isFromMe: false,
              nameCompany: "CÔNG TY TNHH Ô TÔ MỸ ĐÌNH",
                message: "Chào bạn ! Trong bài có đầy đủ các thông tin sản phẩm ạ"

            ),
            CardChatItem(isFromMe: true,
                nameCompany: "vanphuc1503",
                message: "Đánh giá giúp shop 5 sao để được ưu đãi các đơn"
            ),
            CardChatItem(isFromMe: true,
                nameCompany: "levuhoaithuong",
                message: "Giao hàng nhanh, chất lượng sản phẩm tốt lắm ạ, giống mô tả, dùng rất ok, cảm ơn shop"
            ),

          ]
        ),
        Divider(height: 20,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Xem tất cả", style: TextStyle(
              color: kYellowColor,
            ),),
            Icon(Icons.keyboard_arrow_down_rounded, color: kYellowColor,),

          ],
        ),
        SizedBox(height: 10,),

      ],
    );
  }
}


class CardChatItem extends StatelessWidget {
  final bool isFromMe;
  final String nameCompany;
  final String message;
  const CardChatItem({Key? key, isMe, required this.isFromMe, required this.nameCompany, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
      margin: EdgeInsets.only(left: isFromMe ? 0 : 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0)),
        color: isFromMe ? Colors.white : Colors.blue.withOpacity(.1),
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
                  image: AssetImage("assets/account/image_user.png"),
                  fit: BoxFit.fill,
                )
            ),
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        child: Text(nameCompany, style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.blue,

                            fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      Text("10:30 03/30/2020",
                        style: TextStyle(
                            color: kTextColor
                        ),

                      )
                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(message)
                ],
              ))
        ],
      ),
    );
  }
}

