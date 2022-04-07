
import 'package:app_casynet/controller/account/order_account_controller.dart';
import 'package:app_casynet/widget/account/top_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controller/account/order_account_controller.dart';
import '../../../theme/app_colors.dart';
import '../../../controller/detail_store_controller.dart';
import '../../../widget/account/order_all_widget.dart';
import '../../../widget/account/order_cancel_widget.dart';

class OrderAccountPage extends StatelessWidget{
  var _tabx = Get.find<OrderAccountController>();
  OrderAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TopAccountWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text("Đơn hàng của Tôi",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Divider(),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white
                  ),
                  child: TabBar(
                      controller: _tabx.controller,
                      indicatorColor: kYellowColor,
                      unselectedLabelColor: kTextColor,
                      labelColor: kYellowColor,
                      tabs: _tabx.listTabs.map((e) => Tab(
                        child: Text(e,
                          style: TextStyle(
                          ),
                        ),
                      )).toList()
                  ),
                ),
                Expanded(child: TabBarView(
                  controller: _tabx.controller,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) =>
                          OrderAllWidget(
                            name_product: "Máy rửa xe Catorex - CTR",
                            name_store: "Garage Minh Thức",
                          ),
                    ),
                    OrderCancelWidget(name_stores: ["Garage Minh Thức", "Siêu thị anh ninh"],),
                    OrderCancelWidget(name_stores: ["Garage Minh Thức", "Siêu thị anh ninh"],),

                  ],
                ),
                )
              ],
            ),
          )
        )
      ),
    );
  }
}
