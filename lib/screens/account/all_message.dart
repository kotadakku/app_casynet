
import 'package:app_casynet/screens/account/message_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../containts/colors.dart';

class AllMessageAccount extends StatelessWidget {
  const AllMessageAccount({Key? key}) : super(key: key);

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
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: (){
                      Get.to(MessageAccount_2());
                    },
                    child: ListTile(
                        leading: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: ExactAssetImage("assets/account/image_user.png")
                                )
                            ),
                            child:  Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 10,
                                width: 10,

                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white, width: 1),
                                    color: Colors.greenAccent,
                                    shape: BoxShape.circle
                                ),
                              ),
                            )
                        ),
                        title: Text("Gara Ô Tô Hà Nội Car Sevices"),
                        subtitle: Text("Bạn giới thiệu về sản phẩm được không ạ?",
                          style: TextStyle(
                              color: kTextColor,
                              fontSize: 12
                          ),
                        ),
                        trailing: Container(
                          height: 40,
                          width: 40,
                          child: Text("4 giay",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: kTextColor,
                                fontSize: 12
                            ),
                          ),
                        )
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
