import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../containts/colors.dart';

class TopDetailProductWidget extends StatelessWidget {
  const TopDetailProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
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
          ]),
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
                          )),
                      Expanded(
                        child: Container(
                          height: 35,
                          child: TextField(
                            autofocus: false,
                            cursorColor: kYellowColor,
                            style: TextStyle(
                              color: kTextColor_gray,
                              fontSize: 13,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: BorderSide(color: kYellowColor)),
                              hintStyle: const TextStyle(fontSize: 11),
                              hintText: 'Search Sản phẩm',
                              prefixIcon: SizedBox(
                                width: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Icon(
                                    Icons.search,
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
              Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          Get.toNamed('/account/all_message');
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(2.0),
                          child: SvgPicture.asset(
                              "assets/detail_product/message.svg"),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed('/cart');
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(2.0),
                          child:
                          SvgPicture.asset("assets/detail_product/cart.svg"),
                        ),
                      ),
                      PopupMenuButton(
                        elevation: 20,
                        enabled: true,
                        offset: Offset(30, 30),
                        child: Icon(
                          Icons.more_horiz,
                          color: kTextColor,
                        ),
                        onSelected: (value) {
                          switch(value){
                            case 'home': Get.toNamed('/home'); break;
                            case 'product': Get.toNamed('/product/seen_product'); break;
                            case 'account': Get.toNamed('/account/login'); break;
                            case 'help': Get.toNamed('/detail');
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(Icons.home_outlined,
                                    color: kTextColor,
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
                                      Text("Trang chủ",
                                        style: TextStyle(
                                          color: kTextColor
                                        ),
                                      ),
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
                            value: "home",
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(Icons.production_quantity_limits,
                                    color: kTextColor,
                                  ),
                                  padding: EdgeInsets.only(
                                      bottom: 15, right: 10),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sản phẩm đã xem",
                                        style: TextStyle(
                                          color: kTextColor
                                        ),
                                      ),
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
                            value: "product",
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(Icons.account_circle_outlined,
                                    color: kTextColor,
                                  ),
                                  padding: EdgeInsets.only(
                                    bottom: 15,
                                    right: 10),
                                ),
                                Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Tài khoản",
                                          style: TextStyle(
                                              color: kTextColor
                                          ),
                                        ),
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
                            value: "account",
                          ),
                          PopupMenuItem(
                            child: Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.help_outline,
                                    color: kTextColor,
                                  ),
                                  padding: EdgeInsets.only(
                                      bottom: 15, right: 10),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Trợ giúp",
                                        style: TextStyle(color: kTextColor),
                                      ),
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
                            value: "help",
                          ),
                        ]
                      )
                    ],
                  )),
            ],
          ),
        ));
    ;
  }
}
