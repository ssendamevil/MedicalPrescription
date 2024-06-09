import 'package:flutter/material.dart';

class CustomMarkerClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    final double width = size.width;
    final double height = size.height;
    final double tailWidth = width * 0.2; // Width of the tail
    final double tailHeight = height * 0.2; // Height of the tail

    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height - tailHeight);
    path.lineTo(width / 2 + tailWidth / 2, height - tailHeight);
    path.lineTo(width / 2, height);
    path.lineTo(width / 2 - tailWidth / 2, height - tailHeight);
    path.lineTo(0, height - tailHeight);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}