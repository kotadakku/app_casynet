
import 'package:app_casynet/app/views/screens/detail_store/store_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/detail_store_controller.dart';
import '../../../routes/app_pages.dart';
import '../../theme/app_sizes.dart';
import '../product_detail/widgets/top_detail_product_widget.dart';
import 'widgets/aq_store_widget.dart';
import 'widgets/intro_store_widget.dart';
import 'widgets/new_store_widget.dart';
import 'widgets/product_store.dart';
import 'widgets/profile_store.dart';
import 'widgets/vote_store_widget.dart';
import '../../widgets/image_network_loading.dart';
import '../../theme/app_colors.dart';


class DetailsStorePage extends StatelessWidget {
  final DetailStoreController _tabx = Get.find<DetailStoreController>();

  DetailsStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailStoreController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 40,
        toolbarHeight: 50,
        backgroundColor: Colors.white,
        elevation: 10,
        leading: Container(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
              "assets/home/icon_top_home.svg",
              width: 20,
            )
        ),
        title: TopDetailProductWidget(),
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              Get.toNamed(Routes.MESSAGES);
            },
            child: Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.all(2.0),
              child: SvgPicture.asset(
                  "assets/product_detail/message.svg"),
            ),
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(Routes.HOME);
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              height: 30,
              width: 30,
              padding: EdgeInsets.all(2.0),
              child:
              SvgPicture.asset("assets/product_detail/cart.svg"),
            ),
          ),
          PopupMenuButton(
              elevation: 20,
              enabled: true,
              offset: Offset(30, 30),
              child: Icon(
                Icons.more_horiz,
                color: kTextColor,
              ),
              onSelected: (value) {
                switch(value){
                  case 'home': Get.toNamed(Routes.HOME); break;
                  case 'product': Get.toNamed(Routes.PRODUCTS_SEEN); break;
                  case 'account': Get.toNamed(Routes.HOME); break;
                  case 'help': Get.toNamed(Routes.HOME);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.home_outlined,
                          color: kTextColor,
                        ),
                        padding: EdgeInsets.only(
                            bottom: 15,
                            right: 10
                        ),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Trang chủ",
                                style: TextStyle(
                                    color: kTextColor
                                ),
                              ),
                              Divider(
                                color: kTextColor,
                                height: 20,
                                thickness: 1,
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  value: "home",
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.production_quantity_limits,
                          color: kTextColor,
                        ),
                        padding: EdgeInsets.only(
                            bottom: 15, right: 10),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sản phẩm đã xem",
                                style: TextStyle(
                                    color: kTextColor
                                ),
                              ),
                              Divider(
                                color: kTextColor,
                                height: 20,
                                thickness: 1,
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  value: "product",
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(Icons.account_circle_outlined,
                          color: kTextColor,
                        ),
                        padding: EdgeInsets.only(
                            bottom: 15,
                            right: 10),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tài khoản",
                                style: TextStyle(
                                    color: kTextColor
                                ),
                              ),
                              Divider(
                                color: kTextColor,
                                height: 20,
                                thickness: 1,
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  value: "account",
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.help_outline,
                          color: kTextColor,
                        ),
                        padding: EdgeInsets.only(
                            bottom: 15, right: 10),
                      ),
                      Expanded(
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Trợ giúp",
                                style: TextStyle(color: kTextColor),
                              ),
                              Divider(
                                color: kTextColor,
                                height: 20,
                                thickness: 1,
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                  value: "help",
                ),
              ]
          )
        ],
      ),
      body: DefaultTabController(
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
                              child: ImageNetworkLoading(
                                image_url: controller.store.anhsanpham.toString(),
                                fit: BoxFit.fill,
                              )
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
                Material(
                  elevation: 5.0,
                  color: Colors.white,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            child: ElevatedButton(
                                onPressed: () {

                                    Get.to(StoreMapPage(), arguments: {"name": controller.store.tencuahang, "address": controller.store.diachicuahang});

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
                                  _tabx.controller.animateTo(4,
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeInBack
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    onPrimary: Colors.white,
                                    primary: Colors.white,
                                    side:
                                    BorderSide(width: 1.0, color: kYellowColor),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )
                                ),
                                child: Text("Hỏi đáp",
                                    style: TextStyle(color: kYellowColor))),
                          )
                      ),
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
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );

  }
}
