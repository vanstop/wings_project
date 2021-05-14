import 'package:flutter/cupertino.dart';
import 'package:wings_project/core/app_gradients.dart';
import 'package:wings_project/core/app_images.dart';

class AppStyles{
  static Style getStyle(String factionName)
  {
    switch (factionName) {
      case 'First Order':{
        return Style(AppGradients.defaultGradient, AppImages.appLogo);
      } 
      break;
      case 'Galactic Empire':{
        return Style(AppGradients.empire, AppImages.empireLogo);
      } 
      break;
      case 'Galactic Republic':{
        return Style(AppGradients.defaultGradient, AppImages.appLogo);
      } 
      break;
      case 'Rebel Alliance':{
        return Style(AppGradients.rebels, AppImages.rebelsLogo);
      } 
      break;
      case 'Resistance':{
        return Style(AppGradients.defaultGradient, AppImages.appLogo);
      } 
      break;
      case 'Scum and Villainy':{
        return Style(AppGradients.scum, AppImages.scumLogo);
      } 
      break;
      case 'Separatist Alliance':{
        return Style(AppGradients.defaultGradient, AppImages.appLogo);
      } 
      break;
      
      default: {
        return Style(AppGradients.defaultGradient, AppImages.appLogo);
      }
      break;
    }
  }
}

class Style{
  Style(this.gradient, this.logo);

  final Gradient gradient;
  final String logo;
}