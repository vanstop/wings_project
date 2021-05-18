import 'package:flutter/material.dart';
import 'package:wings_project/src/models/ship_model.dart';
import 'package:wings_project/core/app_colors.dart';
import 'package:wings_project/core/app_text_styles.dart';
import 'package:wings_project/home_page/Widgets/body/shipcard_widget.dart';

class WingsListView extends StatelessWidget {

  WingsListView(this.title, this.shipList);

  final String title;
  final List<Ship> shipList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350, //ListView Height
      child: Flex(
        direction: Axis.vertical,
        children: [Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyles.listViewTitle,),
                      ClipOval
                      (
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: 20,
                          height: 20,
                          color: AppColors.darkGrey,
                          child: Text(shipList.length.toString(), style: AppTextStyles.listViewAmount),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ListView.builder(
                      itemCount: shipList.length,
                      itemBuilder: (context, index) {
                        return ShipCard(shipList[index]);
                      },
                      physics: BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),],
      ),
    );
  }
}