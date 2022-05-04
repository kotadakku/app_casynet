import 'dart:math' as math;
import 'package:app_casynet/app/controller/auth/authentication_manager.dart';
import 'package:app_casynet/app/views/widgets/image_network_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';

class ProfileAccountWidget extends StatelessWidget {
  const ProfileAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthenticationManager>(
      init: AuthenticationManager(),
      builder: (controller){
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
                  border: Border.all(color: kYellowColor, width: 2),
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: ImageNetworkLoading(image_url: controller.user_current.image.toString()),
                ),

              ),

            ],
          ),),
        // Tên
        title: Text('${controller.user_current.lastname.toString()} ${controller.user_current.firstname.toString()}',
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
            Text("Thành viên từ: ${controller.user_current.created_at}",
              style: TextStyle(
                  color: kTextColor_gray
              ),
            )
          ],
        ),
      );
    });
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

