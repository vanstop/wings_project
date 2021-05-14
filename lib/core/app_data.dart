import 'package:flutter/material.dart';

class ShipData{
  ShipData(this.name, this.size, this.shipImage, this.logo, this.factionGradient);

  final String name;
  final String size;
  final String shipImage;
  final String logo;
  final Gradient factionGradient;
}