import 'package:app_casynet/widget/home/banner_widget.dart';
import 'package:app_casynet/widget/home/category_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/home/appbar_home_widget.dart';
import '../widget/home/promotion_widget.dart';
import '../widget/home/reservation_home_widget.dart';
import '../widget/bottom_navigator.dart';
import '../widget/bottom_widget.dart';
import '../widget/home/category_widget.dart';
import '../widget/home/store_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarHomeWidget(),
      body: Column(
        children: [
          // Thanh tìm kiếm

          Expanded(child:SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    // Banner
                    BannerHomeWidget(),
                    // Khuyến mãi
                    PromotionHomeWidget(),
                    SizedBox(height: 10.h, child: Container(color: Color(0xffF1F3FD),),),

                    SizedBox(height: 10.h),
                    //Danh mục
                    Container(height: 200,
                      child: CategoryWidget(),
                    ),

                    SizedBox(height: 10.h, child: Container(color: Color(0xffF1F3FD),),),
                    //Cửa hàng
                    StoreWidget(),
                    SizedBox(height: 30.h, child: Container(color: Color(0xffF1F3FD),),),
                    // Đặt chỗ
                    ReservationWidget(title: "Đặt chỗ"),
                    // Khuyến mãi
                    SizedBox(height: 30.h, child: Container(color: Color(0xffF1F3FD),),),
                    ReservationWidget(title: "Khuyến mãi"),
                    SizedBox(height: 30.h, child: Container(color: Color(0xffF1F3FD),),),
                    ReservationWidget(title: "Gợi ý"),
                    // Danh mục
                    CategoryBottomWidget(),

                    BottomWidget(),
                  ],
                ),
              )
          ))
        ],
      ),
    ) ;
  }
}
