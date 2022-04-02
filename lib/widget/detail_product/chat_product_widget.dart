import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data.dart';
import '../../theme/app_colors.dart';

class ChatProductWidget extends StatelessWidget {
  const ChatProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isReadMore = false.obs;
    return ListView(
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
              Text("${chats.length} hỏi đáp",
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

        Obx(()=>ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: isReadMore.value ? chats.length : 5,
          itemBuilder: (context, index) => CardChatItem(
            isFromMe: chats[index]['isMe'],
            nameCompany: chats[index]['user_name'],
            message: chats[index]['content'],
            time: chats[index]['time'],
          )
          ,
        )),
        Divider(height: 20,),
        GestureDetector(
          onTap: (){
            isReadMore.value = !isReadMore.value;
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(()=>Text(isReadMore.value ? "Ẩn bớt" : "Xem tất cả", style: TextStyle(
                color: kYellowColor,
              ),)),
              Obx(()=>Icon(isReadMore.value ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: kYellowColor,))
            ],
          ),
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
  final String time;
  const CardChatItem({Key? key, isMe, required this.isFromMe, required this.nameCompany, required this.message, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
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
                      Text(time,
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

