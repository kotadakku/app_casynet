import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../containts/colors.dart';

class MessageAccount_1 extends StatelessWidget {
  const MessageAccount_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
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
                          Container(
                              child: SvgPicture.asset(
                                "assets/home/icon_top_home.svg",
                                width: 40,
                              )
                          ),
                          Text(
                            "Tin nhắn",
                            style: TextStyle(
                                fontSize: 18
                            ),
                          ),
                          Container(
                            child: Icon(Icons.search),
                            width: 40,
                          )
                        ],
                      ),
                    )
                ),
                SizedBox(height: 20,),
                ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                      Padding(padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
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
                              Text("Gara Ô Tô Hà Nội Car Sevices")
                            ],
                          ),
                          Radio(value: true, groupValue: 123, onChanged: (value){})
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index)=>
                        Divider(
                          height: 0,
                          indent: 60,
                        ),
                    itemCount: 6
                )
              ],
            )
        ),
      ),
    );
  }
}
