import 'package:app_casynet/containts/colors.dart';
import 'package:flutter/material.dart';

class ChatProductWidget extends StatelessWidget {
  const ChatProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hỏi đáp"),
              Text("1000 hỏi đáp")
            ],
          ),
        ),
        Divider(
          height: 10,
          color: kTextColor,
        ),
        Column(
          children: [
            
          ],
        )
      ],
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
