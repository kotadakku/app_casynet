import 'package:app_casynet/theme/app_colors.dart';
import 'package:app_casynet/theme/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/tabview_controller.dart';
import '../widget/detail_product/top_detail_product_widget.dart';
import '../widget/detail_store/aq_store_widget.dart';
import '../widget/detail_store/intro_store_widget.dart';
import '../widget/detail_store/new_store_widget.dart';
import '../widget/detail_store/product_store.dart';
import '../widget/detail_store/profile_store.dart';
import '../widget/detail_store/vote_store_widget.dart';

class DetailsStorePage extends StatelessWidget {
  final TabStoreController _tabx = Get.put(TabStoreController());

  DetailsStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var current_index = 0.obs;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopDetailProductWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                        decoration: BoxDecoration(color: Colors.white),
                        child: TabBar(
                            isScrollable: true,
                            controller: _tabx.controller,
                            indicatorColor: kYellowColor,
                            unselectedLabelColor: kTextColor,
                            labelColor: kYellowColor,
                            onTap: (index) {
                              current_index.value = index;
                            },
                            tabs: _tabx.listTabStores
                                .map((e) => Tab(
                                      child: Text(
                                        e,
                                        style: TextStyle(),
                                      ),
                                    ))
                                .toList()),
                      ),

                      Obx(() {
                        switch (current_index.value) {
                          case 0:
                            return IntroStoreWidget();
                          case 1:
                            return ProductStoreWidget();
                          case 2:
                            return NewsStoreWidget();
                          case 3:
                            return VoteStoreWidget();
                          case 4:
                            return AQStoreWidget();
                          default: return Text('');
                        }
                      })
                    ],
                  ),
                ),
              ),

          //Button
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
                              current_index.value = 4;
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
                              current_index.value = 3;
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
        ),
      ),
    );
  }
}
