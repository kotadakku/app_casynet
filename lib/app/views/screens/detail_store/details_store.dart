
import 'package:app_casynet/app/views/screens/detail_store/store_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/store_detail/detail_store_controller.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_sizes.dart';
import '../../widgets/appbar_cart.dart';
import '../../widgets/image_network_loading.dart';
import 'widgets/aq_store_widget.dart';
import 'widgets/intro_store_widget.dart';
import 'widgets/new_store_widget.dart';
import 'widgets/product_store.dart';
import 'widgets/profile_store.dart';
import 'widgets/vote_store_widget.dart';


class DetailsStorePage extends StatelessWidget {
  final DetailStoreController _tabx = Get.find<DetailStoreController>();

  DetailsStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailStoreController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCartWidget(),
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
