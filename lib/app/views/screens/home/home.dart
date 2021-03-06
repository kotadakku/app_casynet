
// import 'package:app_casynet/app/banner/banner_provider.dart';
import 'package:app_casynet/app/views/widgets/appbar/appbar_home_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/banner_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/category_bottom_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/category_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/promotion_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/recommend_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/reservation_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/store_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/top_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';
import '../../widgets/bottom_widget.dart';


class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarHomeWidget(),
      body: RefreshIndicator(
        onRefresh: () async {
          _homeController.refreshAPI();
        },
        child: SingleChildScrollView(
          physics: const RangeMaintainingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              // Banner
              BannerHomeWidget(),
              // Khuyến mãi
              TopSaleWidget(),
              SizedBox(height: 10.h, child: Container(color: const Color(0xffF1F3FD),),),

              SizedBox(height: 10.h),
              //Danh mục
              CategoryWidget(),

              SizedBox(height: 10.h, child: Container(color: const Color(0xffF1F3FD),),),

              //Cửa hàng
              StoreWidget(),
              SizedBox(height: 30.h, child: Container(color: const Color(0xffF1F3FD),),),
              // Đặt chỗ
              ReservationWidget(),
              // Khuyến mãi
              SizedBox(height: 30.h, child: Container(color: const Color(0xffF1F3FD),),),
              PromotionWidget(),
              SizedBox(height: 30.h, child: Container(color: const Color(0xffF1F3FD),),),
              RecommendWidget(),
              // Danh mục
              CategoryBottomWidget(),

              const BottomWidget(),
            ],
          ),
        ),
      )
    ) ;
  }
}
