import 'dart:math';

import 'package:flutter/material.dart';

class GlitchClipper extends CustomClipper<Path> {
  static const int noEffect = 0;

  int seed;

  // When an animation is reversed, the seed starts at about 200
  // and this effect is super fast, so we slow it down by subtracting
  // 200 from the seed
  final int _offset = 200;

  GlitchClipper(this.seed);

  @override
  Path getClip(Size size) {
    final path = Path();
    if (seed == noEffect) {
      path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));
      return path;
    }

    final random = Random();

    seed -= _offset;

    // Draw a random number of squares
    for (int i = 0; i < seed; i++) {
      final centerPoint = Offset(
        size.width * random.nextDouble(),
        size.height * random.nextDouble(),
      );

      final width = size.width * 0.2 * random.nextDouble();
      final height = size.height * 0.2 * random.nextDouble();

      path.addRect(
        Rect.fromCenter(
          center: centerPoint,
          width: width,
          height: height,
        ),
      );
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
