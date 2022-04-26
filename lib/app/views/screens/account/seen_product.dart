
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/account/appbar_account_widget.dart';
import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';



class SeenProductPage extends StatelessWidget {
  const SeenProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarAccountWidget(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Text(
              "Sản phẩm đã xem",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Divider(
            thickness: 10,
            color: kBackgroundColor,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (context, index){
                return Divider();
              },
              itemBuilder: (context, index) => Container(
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 5.0.h),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        child: Image.asset("assets/detail_product/product_1.png"),
                      ),
                      Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text("Máy rửa xe Catorex - CTR",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                        )
                                    ),
                                    Text("1.290.000 đ",
                                      style: TextStyle(
                                          color: Colors.red
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0.h,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: Text("Garaoto Minh Toàn",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: kTextColor_gray
                                          ),
                                        )
                                    ),
                                    Text("1.290.000 đ",
                                      style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          color: kTextColor_gray,
                                          fontSize: 12
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                                        Icon(Icons.star_outlined , size: sizeIcon.width, color: kYellowColor,),
                                        Icon(Icons.star_half_outlined , size: sizeIcon.width, color: kYellowColor,),
                                        SizedBox(width: 10.w),
                                        Text("Mã: 235345345",
                                          style: TextStyle(
                                              color: kTextColor_gray,
                                              fontSize: 12
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.all(5.0),
                                          child: FaIcon(
                                              FontAwesomeIcons.trash,
                                              color: kTextColor_gray,
                                              size: 12
                                          ),
                                        ),
                                        Text(
                                          "Xóa",
                                          style: TextStyle(
                                              color: kTextColor_gray,
                                              fontSize: 12
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )

                              ],
                            ),
                          )
                      )
                    ],
                  )
              ), itemCount: 3,),
          ),
        ],
      ),
    );
  }
}
