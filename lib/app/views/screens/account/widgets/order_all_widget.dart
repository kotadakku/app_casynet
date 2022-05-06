import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';


class OrderAllWidget extends StatelessWidget {
  final String name_store;
  final String name_product;


  const OrderAllWidget({Key? key, required this.name_store, required this.name_product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.only(left: 15.w, top: 10.h, bottom: 5.h),
            child: Row(
              children: [
                Text(name_store,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: kTextLink
                  ),
                ),
                SizedBox(width: 20.w,),
                Icon(Icons.message_outlined, color: kYellowColor,)
              ],
            )
        ),
        Divider(),
        Padding(padding: EdgeInsets.symmetric(horizontal: 10.w), child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/product_detail/product_1.png")
                  )
              ),
            ),
            SizedBox(width: 10.w,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name_product),
                    Text("1.290.000 đ",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                      ),

                    )
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Phân loại hàng: ngocbich",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 12
                      ),
                    ),
                    Text("1.290.000 đ",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: kTextColor,
                          fontSize: 12
                      ),
                    )
                  ],
                ),
                Text("x1",
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: 12
                  ),)
              ],
            ))
          ],
        ),),
        Divider(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Không nhận được được đánh giá",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 12,
                ),
              ),
              ElevatedButton(
                onPressed: (){},
                child: Text("Mua lần nữa",
                  style: TextStyle(

                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: kYellowColor
                ),
              )
            ],
          ),
        ),
        Container(height: 10, color: kBackgroundColor,)


      ],
    );
  }
}

