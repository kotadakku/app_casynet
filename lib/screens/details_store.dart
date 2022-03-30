import 'package:app_casynet/containts/colors.dart';
import 'package:app_casynet/containts/size.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/tabview_controller.dart';
import '../widget/account/order_all_widget.dart';
import '../widget/account/order_cancel_widget.dart';
import '../widget/detail_product/top_detail_product_widget.dart';
import '../widget/detail_store/aq_store_widget.dart';
import '../widget/detail_store/gift_store_widget.dart';
import '../widget/detail_store/intro_store_widget.dart';
import '../widget/detail_store/new_store_widget.dart';
import '../widget/detail_store/product_store.dart';
import '../widget/detail_store/profile_store.dart';
import '../widget/detail_store/vote_store_widget.dart';

class DetailsStore extends StatelessWidget {
  final TabStoreController _tabx = Get.put(TabStoreController());
  DetailsStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopDetailProductWidget(),
                Container(
                  height: 150,
                  child: Image.asset(
                    "assets/detail_store/anhCuaHang.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                //Thông tin cửa hàng
                ProfileStoreWidget(),
                //Tabbar
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: TabBar(
                      isScrollable: true,
                      controller: _tabx.controller,
                      indicatorColor: kYellowColor,
                      unselectedLabelColor: kTextColor,
                      labelColor: kYellowColor,
                      tabs: _tabx.listTabStores.map((e) => Tab(
                        child: Text(e,
                          style: TextStyle(
                          ),
                        ),
                      )).toList()
                  ),
                ),
                //TabBarView
                Expanded(child: TabBarView(
                  controller: _tabx.controller,
                  children: [
                    IntroStoreWidget(),
                    ProductStoreWidget(),
                    NewsStoreWidget(),
                    VoteStoreWidget(),
                    AQStoreWidget(),
                  ],
                )),
                //Button
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  onPrimary: Colors.white,
                                  primary: Colors.white,
                                  side: BorderSide(width: 1.0, color: kYellowColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )

                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5.0),
                                    child: Icon(Icons.map, color: kYellowColor, size: sizeStar.width,),
                                  ),
                                  Text("Bản đồ", style: TextStyle(
                                      color: kYellowColor
                                  ),)
                                ],)
                          ),
                        )

                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  onPrimary: Colors.white,
                                  primary: Colors.white,
                                  side: BorderSide(width: 1.0, color: kYellowColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )

                              ),
                              child: Text("Hỏi đáp", style: TextStyle(
                                  color: kYellowColor
                              ))
                          ),
                        )

                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: kYellowColor,
                                  side: BorderSide(width: 1.0, color: kYellowColor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )

                              ),
                              child: Text("Đánh giá", style: TextStyle(
                                  color: Colors.white
                              ))
                          ),
                        )

                    ),
                  ],
                )
              ],
            ),

          ),
        ),
    );
  }
}
