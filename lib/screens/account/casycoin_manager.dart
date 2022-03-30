
import 'package:app_casynet/widget/account/top_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../containts/colors.dart';
import '../../controller/tabview_controller.dart';

class CasycoinManager extends StatelessWidget {
  const CasycoinManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabWalletVoucherController _tabx =
    Get.put(TabWalletVoucherController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            TopAccountWidget(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Quản lý tích điểm",
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      Image.asset("assets/cart/icon_coin.png", width: 30,),
                      SizedBox(width: 5.0,),
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
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text("12321"),
                            ),
                            title: Text("Gara Ô Tô Hà Nội Car Sevices",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400
                              ),),
                            trailing: Text("+ 200",
                              style: TextStyle(
                                  color: kYellowColor,
                                  fontWeight: FontWeight.bold
                              ),

                            ),
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
