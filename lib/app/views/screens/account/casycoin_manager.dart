

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/account/casycoin_manager_controller.dart';

import '../../widgets/account/appbar_account_widget.dart';
import '../../theme/app_colors.dart';

class CasycoinManagerPage extends StatelessWidget {
  const CasycoinManagerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CasycoinManagerController _tabx = Get.find<CasycoinManagerController>();
    return Material(

      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarAccountWidget(),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quản lý tích điểm",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/cart/icon_coin.png", width: 30,),
                        SizedBox(width: 5.0.w,),
                        Column(
                          children: [
                            Text("1.800",
                              style: TextStyle(
                                  color: kYellowColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("Tích điểm",
                              style: TextStyle(
                                  color: kTextColor_gray
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
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
                        textAlign: TextAlign.center,
                        style: TextStyle(),
                      ),
                    )
                    ).toList()),
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
                        itemBuilder: (context, index) => ItemCoin(
                            point_change: 200,
                            store_name: "Gara Ô Tô Hà Nội Car Sevices",
                            store_image: ""),
                        itemCount: 3,),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        separatorBuilder: (context, index){
                          return Divider();
                        },
                        itemBuilder: (context, index) => ItemCoin(
                            point_change: 200,
                            store_name: "Gara Ô Tô Hà Nội Car Sevices",
                            store_image: ""),
                        itemCount: 3,),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        separatorBuilder: (context, index){
                          return Divider();
                        },
                        itemBuilder: (context, index) => ItemCoin(
                            point_change: 200,
                            store_name: "Gara Ô Tô Hà Nội Car Sevices",
                            store_image: ""),
                        itemCount: 3,),
                    ],
                  )),
            ],
          ),
        ),
      )
    );
  }
}

class ItemCoin extends StatelessWidget {
  final double point_change;
  final String store_name;
  final String store_image;
  const ItemCoin({Key? key, required this.point_change, required this.store_name, required this.store_image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text("12321"),
      ),
      title: Text(store_name,
        style: TextStyle(
            fontWeight: FontWeight.w400
        ),),
      trailing: Text(point_change.isNegative ? point_change.toString(): "+"+ point_change.toString(),
        style: TextStyle(
            color: point_change.isNegative ? Colors.black : kYellowColor,
            fontWeight: point_change.isNegative ? null : FontWeight.bold,
        ),

      ),
    );
  }
}

