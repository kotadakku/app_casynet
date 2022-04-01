
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../containts/colors.dart';

class MessageAccount_2 extends StatelessWidget {
  const MessageAccount_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kTextColor,
                              offset: const Offset(
                                0.0,
                                13.0,
                              ),
                              blurRadius: 0.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 12.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ),
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: ExactAssetImage("assets/account/image_user.png")
                                    )
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Garage Ôtô An Khánh",
                                    style: TextStyle(
                                        fontSize: 15
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    "Hoạt động 29 phút trước",
                                    style: TextStyle(
                                        fontSize: 10
                                    ),
                                  ),

                                ],
                              ),
                            ],
                          ),
                          Container(
                              child: SvgPicture.asset(
                                "assets/home/icon_top_home.svg",
                                width: 40,
                              )
                          ),
                        ],
                      ),
                    )
                ),
                SizedBox(height: 20,),
                Expanded(child: ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){

                      if(index%2==0) return RawChat(isMe: true);
                      else return RawChat(isMe: false);
                    },
                    itemCount: 20
                ),),
                Container(
                  height: 60,
                  color: kBackgroundColor,
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1,child: Icon(Icons.send, color: kYellowColor,)),
                      Expanded(flex: 1,child: Icon(Icons.send, color: kYellowColor,)),
                      Expanded(flex: 1,child: Icon(Icons.send, color: kYellowColor,)),
                      Expanded(
                          flex: 6,
                          child: Container(
                            height: 40,
                            child: TextField(

                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Nhập tin nhắn",
                                contentPadding: EdgeInsets.all(10.0),
                                hintStyle: TextStyle(
                                    color: kTextColor,
                                    fontSize: 14
                                ),
                                suffixIcon: Icon(Icons.tag_faces, color: kYellowColor,),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(color: kTextColor)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(color: kTextColor)
                                ),
                              ),
                            ),
                          )
                      ),
                      Expanded(flex: 1,child: Icon(Icons.send, color: kYellowColor,))
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}

class RawChat extends StatelessWidget {
  final bool isMe;
  const RawChat({Key? key, required this.isMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Text("12:40, 28/06/2019",
            style: TextStyle(
              color: kTextColor,
              fontSize: 12
            ),
          ),
          Row(
            mainAxisAlignment: isMe ?  MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if(!isMe)
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: ExactAssetImage("assets/account/image_user.png")
                      )
                  ),
                ),
              SizedBox(width: 5,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 20),
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width*0.6
                ),
                decoration: BoxDecoration(
                    color: isMe ? kYellowColor: Colors.grey.withOpacity(0.3) ,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(isMe? 0: 20.0),
                      bottomRight: Radius.circular(isMe? 0 :20.0),
                      bottomLeft: Radius.circular(isMe? 20: 5.0),
                      topLeft: Radius.circular(isMe? 20: 5.0),
                    )
                ),
                child: Text("Garage Tiền Phong xin chào bạn ",
                  style: TextStyle(
                      color: isMe ? Colors.white : Colors.black
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}

