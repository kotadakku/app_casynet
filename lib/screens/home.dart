import 'package:app_casynet/widget/home/banner_widget.dart';
import 'package:app_casynet/widget/home/category_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widget/home/promotion_widget.dart';
import '../widget/home/reservation_home_widget.dart';
import '../widget/bottom_navigator.dart';
import '../widget/bottom_widget.dart';
import '../widget/home/category_widget.dart';
import '../widget/home/store_widget.dart';
import '../widget/home/top_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              // Thanh tìm kiếm
              TopHomeWidget(),
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
                        SizedBox(height: 10, child: Container(color: Color(0xffF1F3FD),),),

                        SizedBox(height: 10),
                        //Danh mục
                        CategoryWidget(),
                        SizedBox(height: 10),
                        SizedBox(height: 10, child: Container(color: Color(0xffF1F3FD),),),
                        //Cửa hàng
                        StoreWidget(),
                        SizedBox(height: 30, child: Container(color: Color(0xffF1F3FD),),),
                        // Đặt chỗ
                        ReservationWidget(title: "Đặt chỗ"),
                        // Khuyến mãi
                        SizedBox(height: 30, child: Container(color: Color(0xffF1F3FD),),),
                        ReservationWidget(title: "Khuyến mãi"),
                        SizedBox(height: 30, child: Container(color: Color(0xffF1F3FD),),),
                        ReservationWidget(title: "Gợi ý"),
                        SizedBox(height: 40),
                        // Danh mục
                        CategoryBottomWidget(),

                        BottomWidget(),
                      ],
                    ),
                  )
              ))
            ],
          )


      )
    )
    ;
  }
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Xác nhận'),
      content: const Text('Bạn có muốn thoát?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('Không'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Đồng ý'),
        ),
      ],
    );
  }
}
