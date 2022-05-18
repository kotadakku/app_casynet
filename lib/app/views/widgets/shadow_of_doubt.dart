import 'package:flutter/material.dart';
import 'dart:math' as math;
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