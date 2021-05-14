import 'dart:ui';
import 'package:flutter/material.dart';

class DropShadow extends StatelessWidget {

  DropShadow(this.image);
  
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      left: -4,
      top: -3,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 2,
          sigmaY: 2,
        ),
        child: Opacity(
          opacity: 0.5,
          child: Image.asset(image, color: Colors.black),
        ),
      ),
    );
  }
}