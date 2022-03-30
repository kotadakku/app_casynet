
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../containts/colors.dart';
import '../../containts/size.dart';
import '../../controller/tabview_controller.dart';
import '../../widget/account/top_account_widget.dart';

class SeenProduct extends StatelessWidget {
  const SeenProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabWalletVoucherController _tabx =
    Get.put(TabWalletVoucherController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopAccountWidget(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TabBar(
                  controller: _tabx.controller,
                  indicatorColor: kYellowColor,
                  unselectedLabelColor: kTextColor,
                  labelColor: kYellowColor,
                  tabs: _tabx.listTab
                      .map((e) => Tab(
                    child: Text(
                      e,
                      style: TextStyle(),
                    ),
                  ))
                      .toList()),
            ),
            Expanded(
                child: TabBarView(
                  controller: _tabx.controller,
                  children: [
                    ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      separatorBuilder: (context, index){
                        return Divider();
                      },
                      itemBuilder: (context, index) => Container(
                          width: 100,
                          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: Image.asset("assets/detail_product/product_1.png"),
                              ),
                              Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
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
                                        SizedBox(height: 5.0,),
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
                                                Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                                                Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                                                Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                                                Icon(Icons.star_outlined , size: sizeStar.width, color: kYellowColor,),
                                                Icon(Icons.star_half_outlined , size: sizeStar.width, color: kYellowColor,),
                                                SizedBox(width: 10),
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
                    Text("123"),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
