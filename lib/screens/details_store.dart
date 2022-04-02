import 'package:app_casynet/controller/detail_store_controller.dart';
import 'package:app_casynet/theme/app_colors.dart';
import 'package:app_casynet/theme/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/detail_product/top_detail_product_widget.dart';
import '../widget/detail_store/aq_store_widget.dart';
import '../widget/detail_store/intro_store_widget.dart';
import '../widget/detail_store/new_store_widget.dart';
import '../widget/detail_store/product_store.dart';
import '../widget/detail_store/profile_store.dart';
import '../widget/detail_store/vote_store_widget.dart';

class DetailsStorePage extends StatelessWidget {
  final DetailStoreController _tabx = Get.find<DetailStoreController>();

  DetailsStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Column(
          children: [
            TopDetailProductWidget(),
            Expanded(
              child: DefaultTabController(
                  length: 5,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, isScrolled) {
                      return [
                        SliverList(
                            delegate: SliverChildListDelegate([
                              Container(
                                child: Column(
                                  children: [

                                    Container(
                                      height: 150,
                                      child: Image.asset(
                                        "assets/detail_store/anhCuaHang.png",
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    ProfileStoreWidget(),
                                  ],
                                ),

                              )
                            ]))
                      ];
                    },
                    body: Column(
                      children: [
                        TabBar(
                            isScrollable: true,
                            controller: _tabx.controller,
                            indicatorColor: kYellowColor,
                            unselectedLabelColor: kTextColor,
                            labelColor: kYellowColor,
                            onTap: (index) {
                            },
                            tabs: _tabx.listTabs.map((e) =>
                                Tab(
                                  child: Text(e,
                                    style: TextStyle(),
                                  ),
                                )
                            ).toList()
                        ),
                        Expanded(
                            child: TabBarView(
                              controller: _tabx.controller,
                              children: [
                                IntroStoreWidget(),
                                ProductStoreWidget(),
                                NewsStoreWidget(),
                                VoteStoreWidget(),
                                AQStoreWidget(),
                              ],
                            )
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          onPrimary: Colors.white,
                                          primary: Colors.white,
                                          side:
                                          BorderSide(width: 1.0, color: kYellowColor),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(5.0),
                                            child: Icon(
                                              Icons.map,
                                              color: kYellowColor,
                                              size: sizeIcon.width,
                                            ),
                                          ),
                                          Text(
                                            "Bản đồ",
                                            style: TextStyle(color: kYellowColor),
                                          )
                                        ],
                                      )),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        _tabx.controller.animateTo(4);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          onPrimary: Colors.white,
                                          primary: Colors.white,
                                          side:
                                          BorderSide(width: 1.0, color: kYellowColor),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )),
                                      child: Text("Hỏi đáp",
                                          style: TextStyle(color: kYellowColor))),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.all(5.0),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        _tabx.controller.animateTo(3);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: kYellowColor,
                                          side:
                                          BorderSide(width: 1.0, color: kYellowColor),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                          )),
                                      child: Text("Đánh giá",
                                          style: TextStyle(color: Colors.white))),
                                )),
                          ],
                        )
                      ],
                    ),
                  )
              ),
            )

          ],
        )
      )
    );

  }


}
