
import 'package:app_casynet/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromotionHomeWidget extends StatelessWidget {
  const PromotionHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.all(10.0),
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller){
          return ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            children: controller.listSales.map((e) => CardItem(image_url: e.image, title: e.title)).toList()
          );
        }
      ));
  }
}

class CardItem extends StatelessWidget {
  final String image_url;
  final String title;
  const CardItem({Key? key, required this.image_url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      child: Column(
        children: [
          Image.network(image_url, width: 50, height: 50,),
          SizedBox(height: 10,),
          Text(title),
        ],
      ),
    );
  }
}
