
import 'package:flutter/material.dart';

class PromotionHomeWidget extends StatelessWidget {
  const PromotionHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CardItem(image_url: "assets/home/flash_sale.png", title: "Flash Sale"),
            CardItem(image_url: "assets/home/free_ship.png", title: "Free Ship"),
            CardItem(image_url: "assets/home/tichdiem.png", title: "Tích điểm"),
            CardItem(image_url: "assets/home/khuyenmai.png", title: "Khuyến mãi  10"),
          ],
        )
    );
  }
}

class CardItem extends StatelessWidget {
  final String image_url;
  final String title;
  const CardItem({Key? key, required this.image_url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image_url, width: 50, height: 50,),
        SizedBox(height: 10,),
        Text(title),
      ],
    );
  }
}
