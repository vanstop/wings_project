
import 'package:flutter/material.dart';
import 'package:wings_project/core/app_colors.dart';
import 'package:wings_project/core/app_images.dart';
import 'package:wings_project/core/app_sizes.dart';
import 'package:wings_project/core/app_text_styles.dart';

class WingsAppBar extends PreferredSize{
  WingsAppBar() : super(
    preferredSize: Size.fromHeight(AppSizes.appBar),
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppImages.appLogo),
              ),
              Text("X-Wing Companion", style: AppTextStyles.title),
            ],
          ),
          ConfigIcon(),
        ],
      ),
    )
  );
}

class ConfigIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(AppImages.settingsLogo, color: AppColors.darkGrey,),
    );
  }
}