
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../containts/colors.dart';

class TopDetailProductWidget extends StatelessWidget {
  const TopDetailProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            children: [
              Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          "assets/home/icon_top_home.svg",
                          width: 30,
                        )
                      ),
                      Expanded(
                        child: Container(
                          height: 35,
                          child:  TextField(
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                              hintStyle: const TextStyle(
                                  fontSize: 11
                              ),
                              hintText: 'Search Sản phẩm',
                              prefixIcon: SizedBox(width: 50, child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                child: Icon(Icons.search),
                              ),),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.message_rounded, color: kTextColor,),
                    Icon(Icons.add_shopping_cart, color: kTextColor,),
                    PopupMenuButton(
                        elevation: 20,
                        enabled: true,
                        offset: Offset(30, 30),
                        child: Icon(Icons.more_horiz, color: kTextColor,),
                        onSelected: (value) {
                        },
                        itemBuilder:(context) => [
                          PopupMenuItem(
                            child:
                              Row(
                                children: [
                                 Container(child:  Icon(Icons.home_outlined),padding: EdgeInsets.only(bottom: 15, right:10),),
                                  Expanded(child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Trang chủ"),
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
                            value: "first",
                          ),
                          PopupMenuItem(
                            child:
                            Row(
                              children: [
                                Container(child:  Icon(Icons.production_quantity_limits),padding: EdgeInsets.only(bottom: 15, right:10),),
                                Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Sản phẩm đã xem"),
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
                            value: "first",
                          ),
                          PopupMenuItem(
                            child:
                            Row(
                              children: [
                                Container(child:  Icon(Icons.account_circle_outlined),padding: EdgeInsets.only(bottom: 15, right:10),),
                                Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tài khoản"),
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
                            value: "first",
                          ),
                          PopupMenuItem(
                            child:
                            Row(
                              children: [
                                Container(child:  Icon(Icons.help_outline, color: kTextColor,),padding: EdgeInsets.only(bottom: 15, right:10),),
                                Expanded(child:
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Trợ giúp"),
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
                            value: "first",
                          ),
                        ]
                    )
                  ],
                )
              ),
            ],
          ),
        )
    );;
  }
}
