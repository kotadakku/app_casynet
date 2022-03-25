
import 'package:app_casynet/containts/colors.dart';
import 'package:flutter/material.dart';

import '../home/reservation_home_widget.dart';

class FeaturedProductWidget extends StatelessWidget {
  const FeaturedProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ Container(
        padding: const EdgeInsets.only(top: 10, left: 10),
        width: double.infinity,
        child: Text("Sản phẩm nổi bật",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kYellowColor,
            fontSize: 18
          ),
        ),
        ),
        Divider(
          height: 20,
          color: kTextColor,
        ),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            ItemBookWidget(
                book_image: "assets/home/book/image.png",
                distance: 4.5,
                price: "1.290.000đ",
                price_discount: "1.390.000đ",
                book_name: "Máy rửa xe Catorex - CTR",
                book_category: "Điện máy Đỗ Dũng"
            ),
            ItemBookWidget(
                book_image: "assets/home/store/cuahang1.png",
                distance: 4.5,
                price: "1.290.000đ",
                price_discount: "1.390.000đ",
                book_name: "Máy rửa xe Catorex - CTR",
                book_category: "Điện máy Đỗ Dũng"
            ),
            ItemBookWidget(
                book_image: "assets/home/book/image.png",
                distance: 4.5,
                price: "1.290.000đ",
                price_discount: "1.390.000đ",
                book_name: "Máy rửa xe Catorex - CTR",
                book_category: "Điện máy Đỗ Dũng"
            ),
            ItemBookWidget(
                book_image: "assets/home/store/cuahang1.png",
                distance: 4.5,
                price: "1.290.000đ",
                price_discount: "1.390.000đ",
                book_name: "Máy rửa xe Catorex - CTR",
                book_category: "Điện máy Đỗ Dũng"
            ),
          ],
        ),
        Divider(
          height: 20,
          color: kTextColor,
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Xem thêm", style: TextStyle(
                color: kYellowColor,
              ),),
              Icon(Icons.keyboard_arrow_down_rounded, color: kYellowColor,),

            ],
          ),
        )
      ],
    );
  }
}
