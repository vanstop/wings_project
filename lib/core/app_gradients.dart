import 'dart:ui';
import 'package:flutter/material.dart';

class AppGradients {

  static final scum = LinearGradient(
    begin: Alignment(- 1.6, -1),
    end: Alignment(1.6, 1),

    stops: [
      0.15,
      0.5,
      0.85,
    ],
    
    colors: [
      Color(0xFF775d00),
      Color(0xFFebc329),
      Color(0xFF775d00),
    ], 
  );

  static final rebels = LinearGradient(
    begin: Alignment(- 1.6, -1),
    end: Alignment(1.6, 1),

    stops: [
      0.15,
      0.5,
      0.85,
    ],
    
    colors: [
      Color(0xFF350008),
      Color(0xFF921a1d),
      Color(0xFF350008),
    ], 
  );

  static final empire = LinearGradient(
    begin: Alignment(- 1.6, -1),
    end: Alignment(1.6, 1),

    stops: [
      0.15,
      0.5,
      0.85,
    ],
    
    colors: [
      Color(0xFF000a38),
      Color(0xFF66d5ff),
      Color(0xFF000a38),
    ], 
  );

   static final defaultGradient = LinearGradient(
    begin: Alignment(- 1.6, -1),
    end: Alignment(1.6, 1),

    stops: [
      0.15,
      0.5,
      0.85,
    ],
    
    colors: [
      Colors.black,
      Colors.amber,
      Colors.black,
    ], 
  );
}
