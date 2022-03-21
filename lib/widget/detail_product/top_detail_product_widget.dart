
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
                          child: SvgPicture.asset(
                            "assets/home/icon_top_home.svg",
                            width: 40,
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
                    Icon(Icons.message_rounded,),
                    Icon(Icons.add_shopping_cart),
                    Icon(Icons.more_horiz_outlined)
                  ],
                )
              ),
            ],
          ),
        )
    );;
  }
}
