import 'package:flutter/material.dart';

class ArrowHeadClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, size.height * 0.45);
    path.lineTo(size.width, size.height * 0.55);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.9);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(size.width * 0.7, size.height * 0.5);
    path.lineTo(0, size.height * 0.2);
    path.lineTo(0, size.height * 0.1);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
