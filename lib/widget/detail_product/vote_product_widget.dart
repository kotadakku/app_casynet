
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../containts/colors.dart';
import '../../containts/size.dart';

class VoteProductWidget extends StatelessWidget {
  const VoteProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text("Chi tiết sản phẩm", style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
        ),
        Divider(color: kTextColor,),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          child: IntrinsicHeight(child:Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("4.5",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("/5")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                              Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                              Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                              Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                              Icon(Icons.star_half_outlined , size: sizeStar.width, color: kYellowColor,),
                            ],
                          ),
                        ],
                      ),
                      Text("(2 lượt đánh giá)")
                    ],

                  )
              ),
              VerticalDivider(
                width: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.8,
                              color: kYellowColor,
                              backgroundColor: kTextColor,
                            ),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.2,
                              color: kYellowColor,
                              backgroundColor: kTextColor,

                            ),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.5,
                              color: kYellowColor,
                              backgroundColor: kTextColor,
                            ),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.4,
                              color: kYellowColor,
                              backgroundColor: kTextColor,
                            ),)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          Icon(Icons.star_outline , size: sizeStar.width, color: kYellowColor,),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.4,
                              color: kYellowColor,
                              backgroundColor: kTextColor,
                            ),)
                        ],
                      ),
                    ],
                  ),
              )
            ],
          ),
        )),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Ảnh gửi từ khách hàng (34)"),
            Text("Xem thêm")
          ],
        ),
        SizedBox(height: 10,),
        SizedBox(
          width: double.infinity,
          child: Wrap(
              spacing: 5.0, alignment: WrapAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width /4-10,
                  height: MediaQuery.of(context).size.width /4-10,
                  child: Image.asset(
                      "assets/detail_product/product_1.png"
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width /4-10,
                  height: MediaQuery.of(context).size.width /4-10,
                  child: Image.asset(
                      "assets/detail_product/product_1.png"
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width /4-10,
                  height: MediaQuery.of(context).size.width /4-10,
                  child: Image.asset(
                      "assets/detail_product/product_1.png"
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width /4-10,
                  height: MediaQuery.of(context).size.width /4-10,

                  child: Stack(
                      fit: StackFit.expand,
                    children: [
                      Image.asset('assets/detail_product/product_1.png', fit: BoxFit.cover),
                    ClipRRect( // Clip it cleanly.
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.black.withOpacity(0.1),
                            alignment: Alignment.center,
                            child: Text('+30'),
                          ),
                        ),
                      )
                    ]
                  )
                ),
              ]
          )
        ),
        SizedBox(height: 10,),


      ],
    );
  }
}
