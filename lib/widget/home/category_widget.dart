
import 'package:flutter/material.dart';

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
