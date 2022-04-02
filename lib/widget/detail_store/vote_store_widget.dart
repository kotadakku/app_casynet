import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme//app_colors.dart';
import '../../theme/app_sizes.dart';
import '../../data.dart';
import 'gift_store_widget.dart';

class VoteStoreWidget extends StatelessWidget {
  const VoteStoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isReadMore = false.obs;
    return SingleChildScrollView(
      child: Column(
        children: [
          GiftStoreWidget(),
          SizedBox(height: 10,),
          Image.asset("assets/detail_store/vote.png", fit: BoxFit.fitWidth),
          Wrap(
            runSpacing: 0,
            spacing: 10,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width/3-15,
                child:  ElevatedButton(
                  onPressed: (){},
                  child: Text("Tất cả (44)"),
                  style: ElevatedButton.styleFrom(
                    primary: kYellowColor,
                    side: BorderSide(
                      color: kYellowColor
                    )
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/3-15,
                child:  ElevatedButton(
                  onPressed: (){},
                  child: Text("5 Sao (12)",
                    style: TextStyle(
                      color: kTextColor
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                          color: kTextColor
                      )
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/3-15,
                child:  ElevatedButton(
                  onPressed: (){},
                  child: Text("4 Sao (8)",
                    style: TextStyle(
                        color: kTextColor
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                          color: kTextColor
                      )
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/3-15,
                child:  ElevatedButton(
                  onPressed: (){},
                  child: Text("3 Sao (3)",
                    style: TextStyle(
                        color: kTextColor
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                          color: kTextColor
                      )
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/3-15,
                child:  ElevatedButton(
                  onPressed: (){},
                  child: Text("2 Sao (2)",
                    style: TextStyle(
                        color: kTextColor
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                          color: kTextColor
                      )
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width/3-15,
                child:  ElevatedButton(
                  onPressed: (){},
                  child: Text("1 Sao (1)",
                    style: TextStyle(
                        color: kTextColor
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(
                          color: kTextColor
                      )
                  ),
                ),
              ),


            ],
          ),
          Container(
            color: kBackgroundColor,
            height: 10,
          ),
          Obx(()=>ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: isReadMore.value ? 5: chats.length,
              itemBuilder: (context, index){
                return CardChatItem(isFromMe: chats[index]['isMe'], nameUser:  chats[index]['user_name'], message:  chats[index]['content']);
              }
          )),
          Divider(),
          GestureDetector(
            onTap: (){
              isReadMore.value = !isReadMore.value;
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(()=>Text(isReadMore.value ? "Xem thêm": "Ẩn bớt", style: TextStyle(
                    color: kYellowColor
                ),),),
                Obx(()=>Container(
                  margin: EdgeInsets.all(5.0),
                  child: Icon(isReadMore.value ? Icons.keyboard_arrow_down_sharp : Icons.keyboard_arrow_up_sharp, color: kYellowColor, size: 15,),
                ))

              ],
            ),
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
      padding: EdgeInsets.only(left: 10, right: 30, top: 10, bottom: 10),
      margin: EdgeInsets.only(left: isFromMe ? 30 : 0, bottom: 5, top:5),
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
                      if(isFromMe)
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                          Icon(Icons.star_half_outlined , size: sizeIcon.width, color: kYellowColor,),
                        ],
                      ),
                      if(isFromMe) SizedBox(width: 10,),
                      Text("10:30 03/30/2020",
                        style: TextStyle(
                            color: kTextColor,
                            fontSize: 12
                        ),

                      )
                    ],
                  ),

                  SizedBox(height: 10,),
                  Text(message)
                ],
              )),

        ],
      ),
    );
  }
}
