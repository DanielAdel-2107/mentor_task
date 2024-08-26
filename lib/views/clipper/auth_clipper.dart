import 'package:flutter/material.dart';

class AuthClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.03, size.height * 0.75,
        size.width * 0.1, size.height * 0.70);
    path.lineTo(size.width, size.height * 0.70);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
