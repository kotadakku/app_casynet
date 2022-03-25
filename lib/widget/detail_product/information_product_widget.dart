import 'package:app_casynet/containts/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../containts/size.dart';

class InformationProductWidget extends StatelessWidget {
  const InformationProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text("Máy rửa xe BOSS 2300w thế hệ mới new 2019",
            style: Theme.of(context).textTheme.titleMedium
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("1.400.000 ",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              ),
              SizedBox(width: 5,),
              Text("1.800.000",
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 13,
                  decoration: TextDecoration.lineThrough
                ),
              ),
              SizedBox(width: 5,),
              Text("-17%", style: TextStyle(
                color: kTextColor
              ),)
            ],
          ),

          Divider(color: kTextColor,),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                    Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                    Icon(Icons.star_half_outlined , size: sizeStar.width, color: kYellowColor,),
                    SizedBox(width: 5,),
                    Text("4.5", style: TextStyle(
                        color: kTextColor
                    ),)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.warning, color: kYellowColor, size: sizeStar.width),
                    Text("Báo xấu: ", style: TextStyle(
                        color: kTextColor
                    ),),
                    Text("3")
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.add_shopping_cart, color: kTextColor, size: sizeStar.width),
                    Text("10 "),
                    Text("đã bán", style: TextStyle(
                        color: kTextColor
                    ),),

                  ],
                )

              ],
            ),
          ),
          Divider(color: kTextColor,),
          SizedBox(height: 10,),
          Row(
            children: [
              SvgPicture.asset("assets/detail_product/gift.svg", width: sizeStar.width),
              SizedBox(width: 5,),
              Text("Quà tặng của của hàng: "),
              Text("Giảm đ 2K"),
              Text("Giảm đ 3K"),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              SvgPicture.asset("assets/detail_product/coin.svg", width: sizeStar.width),
              SizedBox(width: 5,),
              Text("Mua hàng và tích "),
              Text("800 ", style: TextStyle(
                color: kYellowColor,
                fontWeight: FontWeight.bold
              ),),
              Text("Casycoin", style: TextStyle(
                color: kTextColor
              ),),
              Icon(Icons.help, color: Colors.blue, size: sizeStar.width,)
            ],
          ),
          SizedBox(height: 10,),
          Container(
            color: kBackgroundColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Yêu cầu hẹn trước ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: [

                            Container(
                              width: 60,
                              child: Text("Ngày"),
                            ),
                            Expanded(
                                child: Container(
                                    height: 30,
                                    color: Colors.white,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: kTextColor, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: kTextColor, width: 1.0),
                                        ),
                                        suffixIcon: Icon(Icons.calendar_today, color: kTextColor, size: sizeStar.width,)
                                      ),
                                    )
                                )
                            )
                          ],
                        )
                      ),
                      Flexible(
                          flex: 1,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Text("Giờ"),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  height: 30,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: kTextColor, width: 1.0),
                                      ),
                                        suffixIcon: Icon(Icons.access_time, color: kTextColor, size: sizeStar.width,)
                                    ),
                                  )
                                )

                              )
                            ],
                          )
                      )
                    ],

                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        width: 60,
                        child: Text("Ghi chú"),
                      ),
                      Expanded(
                          child: Container(
                              color: Colors.white,
                              height: 30,
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kTextColor, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kTextColor, width: 1.0),
                                  ),
                                ),
                              )
                          )

                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(width: 60,),
                      Flexible(child: Container(
                        height: 30,
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite_border, color: kYellowColor, size: sizeStar.width,),
                              SizedBox(width: 5,),
                              Text("Bản đồ",
                                style: TextStyle(

                                    color: kYellowColor
                                ),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                          ), onPressed: () {  },
                        ),
                      ),),
                      SizedBox(width: 10,),
                      Flexible(child:  Container(
                        height: 30,
                        child: ElevatedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.share, color: kYellowColor, size: sizeStar.width,),
                              SizedBox(width: 5,),
                              Text("Liên hệ",
                                style: TextStyle(
                                    color: kYellowColor
                                ),
                              )
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,

                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                          ), onPressed: () {  },
                        ),
                      ),),
                    ],
                  ),
                  SizedBox(height: 20,)

                ],
              )



            ),
          )
        ],
      ),
    );
  }
}
