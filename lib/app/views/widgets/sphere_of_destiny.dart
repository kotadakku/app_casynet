
import 'package:flutter/material.dart';

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