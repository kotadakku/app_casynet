import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class ProfileAccountWidget extends StatelessWidget {
  const ProfileAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      // Ảnh đại diện
      leading: Container(
      child: Stack(
        children: [
          ShadowOfDoubt(
            diameter: 60,
            origin: Offset(0,60),
          ),
          Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/account/image_user.png"),
                ),
                border: Border.all(color: kYellowColor, width: 2),
                color: Colors.white,
                shape: BoxShape.circle,
              ),

            ),

        ],
      ),),
      // Tên
      title: Text("Jave Rubi",
        style: TextStyle(
          color: kYellowColor,
          fontWeight: FontWeight.bold
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            "Tài khoản Facebook",
            style: TextStyle(
              color: kTextColor_gray
            ),
          ),
          // Ngày tham gia
          Text("Thành viên tù: 09/04/2020",
            style: TextStyle(
                color: kTextColor_gray
            ),
          )
        ],
      ),
    );
  }
}

class SphereOfDestiny extends StatelessWidget {
  const SphereOfDestiny({
    Key? key,
    required this.diameter, required this.lightSource
  }) : super(key: key);

  final double diameter;
  final Offset lightSource;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: const [Colors.grey, Colors.black],
          center: Alignment(lightSource.dx, lightSource.dy),

        ),

      ),
    );
  }
}

class  ShadowOfDoubt extends StatelessWidget {
  final double diameter;
  final Offset origin;
  const ShadowOfDoubt({Key? key, required this.diameter, required this.origin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()..rotateX(math.pi / 2.2),
        origin: origin,
        child: Container(
          width: diameter,
          height: diameter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: const [Colors.grey, Colors.white],

            ),
          ),
        )
    );
  }
}

