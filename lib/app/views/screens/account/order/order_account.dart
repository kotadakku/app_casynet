
import 'package:app_casynet/app/controller/account/api/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/account/order_account_controller.dart';

import '../widgets/appbar_account_widget.dart';
import '../widgets/order_all_widget.dart';
import '../widgets/order_cancel_widget.dart';
import '../../../theme/app_colors.dart';

class OrderAccountPage extends StatelessWidget{
  var _tabx = Get.find<OrderAccountController>();
  OrderAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarAccountWidget(),
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 15.h),
                    child: Text("Đơn hàng của Tôi",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Divider(
                    height: 20.h,
                  ),
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
                      OrderAllWidget(
                        name_product: "Máy rửa xe Catorex - CTR",
                        name_store: "Garage Minh Thức",
                      ),

                      OrderCancelWidget(name_stores: ["Garage Minh Thức", "Siêu thị anh ninh"],),
                      OrderCancelWidget(name_stores: ["Garage Minh Thức", "Siêu thị anh ninh"],),

                    ],
                  ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
