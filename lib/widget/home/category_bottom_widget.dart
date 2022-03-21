import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../containts/colors.dart';
import '../../containts/colors.dart';
import '../../containts/colors.dart';

class CategoryBottomWidget extends StatelessWidget {
  const CategoryBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
          runSpacing: 10,
          children: [
            CategoryItemBottom(),
            CategoryItemBottom(),
            CategoryItemBottom(),
            CategoryItemBottom(),
            CategoryItemBottom(),
            CategoryItemBottom()
          ]
      ),
    );
  }
}

class CategoryItemBottom extends StatelessWidget {
  const CategoryItemBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: LayoutBuilder(builder: (context, constraint) => Container(
      width: constraint.maxWidth/2-10,

      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            width: 1,
              color: kYellowColor)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset("assets/home/category/left_bottom.svg", height: 40,),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: SvgPicture.asset("assets/home/category/bt_ruaxethaydau.svg", height: 16))
                ],
              ),
              SizedBox(width: 15,),
              Text("Rửa xe, thay dầu",
                style: TextStyle(
                    color: kTextColor
                ),
              )
            ],
          ),
        ],
      ))

    ),);
  }
}

