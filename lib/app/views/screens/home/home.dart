
// import 'package:app_casynet/app/banner/banner_provider.dart';
import 'package:app_casynet/app/controller/home/home_controller.dart';
import 'package:app_casynet/app/views/screens/home/widgets/appbar_home_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/banner_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/category_bottom_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/category_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/promotion_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/recommend_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/reservation_home_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/store_widget.dart';
import 'package:app_casynet/app/views/screens/home/widgets/top_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import '../../../banner/banner_provider.dart';
import '../../../controller/home/fetch_banner_controller.dart';
import '../../../controller/home/fetch_topsales_controller.dart';
import '../../widgets/bottom_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find();
    FetchTopSalesController _fetchTopSalesController = Get.find();
    FetchBannerController _fetchBannerController = Get.find();

    return Scaffold(
      appBar: AppBarHomeWidget(),
      body: RefreshIndicator(
        onRefresh: () async {
          if(_fetchBannerController.isLoading == false){
            await _fetchBannerController.getBannerAPI();
          }
          if(_fetchTopSalesController.isLoadingComplete == false){
            await _fetchTopSalesController.getSalesAPI();
          }


        },
        child: SingleChildScrollView(
            physics: RangeMaintainingScrollPhysics(),
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Banner
                  BannerHomeWidget(),

                  // test
                  /*Container(
                    height: 50.0.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(onPressed: (){
                          BannerDatabaseHelper.instance.getAll().then((value) {
                            if(value?.length == 0){
                              BannerDatabaseHelper.instance.insert();
                            }

                          });


                        }, child: Text("Select")),
                        OutlinedButton(onPressed: (){}, child: Text("Insert")),
                        OutlinedButton(onPressed: (){}, child: Text("update")),
                        OutlinedButton(onPressed: (){}, child: Text("delete")),
                      ],
                    ),
                  ),*/
                  // Khuyến mãi
                  TopSaleWidget(),
                  SizedBox(height: 10.h, child: Container(color: Color(0xffF1F3FD),),),

                  SizedBox(height: 10.h),
                  //Danh mục
                  CategoryWidget(),

                  SizedBox(height: 10.h, child: Container(color: Color(0xffF1F3FD),),),

                  //Cửa hàng
                  StoreWidget(),
                  SizedBox(height: 30.h, child: Container(color: Color(0xffF1F3FD),),),
                  // Đặt chỗ
                  ReservationWidget(),
                  // Khuyến mãi
                  SizedBox(height: 30.h, child: Container(color: Color(0xffF1F3FD),),),
                  PromotionWidget(),
                  SizedBox(height: 30.h, child: Container(color: Color(0xffF1F3FD),),),
                  RecommendWidget(),
                  // Danh mục
                  CategoryBottomWidget(),

                  BottomWidget(),
                ],
              ),
            )
        ),
      )
    ) ;
  }
}
