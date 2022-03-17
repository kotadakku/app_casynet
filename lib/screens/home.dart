import 'package:app_casynet/widget/home/banner_home_widget.dart';
import 'package:app_casynet/widget/home/category_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../widget/home/book_widget.dart';
import '../widget/home/bottom_navigator.dart';
import '../widget/home/bottom_widget.dart';
import '../widget/home/category_widget.dart';
import '../widget/home/card_item_category.dart';
import '../widget/home/store_widget.dart';
import '../widget/home/top_home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigator() ,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopHome(),
                const BannerHome(),
                Padding(padding: EdgeInsets.all(10.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CardItem(image_url: "assets/home/flash_sale.png", title: "Flash Sale"),
                      CardItem(image_url: "assets/home/free_ship.png", title: "Free Ship"),
                      CardItem(image_url: "assets/home/tichdiem.png", title: "Tích điểm"),
                      CardItem(image_url: "assets/home/khuyenmai.png", title: "Khuyến mãi  10"),
                    ],
                  )
                ),
                SizedBox(height: 10, child: Container(color: Color(0xffF1F3FD),),),

                const Padding(
                  padding:EdgeInsets.all(10.0),
                  child: Text('DANH MỤC'),
                ),
                SizedBox(height: 10),
                CategoryWidget(),
                SizedBox(height: 10),
                SizedBox(height: 10, child: Container(color: Color(0xffF1F3FD),),),
                StoreWidget(),
                SizedBox(height: 30, child: Container(color: Color(0xffF1F3FD),),),
                BookWidget(title: "Đặt chỗ"),
                SizedBox(height: 40),
                CategoryBottomWidget(),
                BottonWidget(),
              ],
            ),
        )
      )
    ),
    )
    ;
  }
}
