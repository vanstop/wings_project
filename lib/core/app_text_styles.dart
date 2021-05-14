import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle title =  TextStyle(
    fontFamily: "Coolveltica",
    color: AppColors.darkGrey,
    fontSize: 22,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle listViewTitle =  TextStyle(
    fontFamily: "Coolveltica",
    color: AppColors.darkGrey,
    fontSize: 35,
    fontWeight: FontWeight.w400,
    letterSpacing: 1,
  );

  static final TextStyle listViewAmount =  TextStyle(
    fontFamily: "Coolveltica",
    color: AppColors.white,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.02
  );

  static final TextStyle shipCardName =  TextStyle(
    fontFamily: "Coolveltica",
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.02
  );

  static final TextStyle shipCardSize =  TextStyle(
    fontFamily: "Coolveltica",
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.02
  );
}