import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wings_project/api/Ship.dart';
import 'package:wings_project/core/app_images.dart';
import 'package:wings_project/core/app_styles.dart';
import 'package:wings_project/core/app_text_styles.dart';
import 'package:wings_project/core/app_widgets/app_dropshadow.dart';
import 'package:wings_project/core/app_widgets/app_infinitylistview.dart';

class ShipCard extends StatefulWidget {
  
  ShipCard(this.ship);

  final Ship ship; 

  @override
  _ShipCardState createState() => _ShipCardState();
}

class _ShipCardState extends State<ShipCard> {
  
  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: Axis.vertical,
        children: [Expanded(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GradientCard(faction: widget.ship.faction),
                FactionLogo(faction: widget.ship.faction),
                PilotImage(widget: widget),
                ShipNameAndSize(name: widget.ship.name, size: widget.ship.size),
                Positioned(left: 0, child: Image.network(widget.ship.icon)),
                //ShipImage(shipImage: AppImages.shipQuadjumper),
              ],
            ),
          ),
        ),
      ),],
    );
  }
}

class PilotImage extends StatelessWidget {
  const PilotImage({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ShipCard widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: 140,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        ),
        child: Stack(
          children: [
            Image.network(widget.ship.pilots[0].artwork),
            Opacity(opacity: 0.4, child: Image.network(widget.ship.pilots[0].artwork, color: Colors.black,)),
          ],
        )
      ),
    );
  }
}

class ShipImage extends StatelessWidget {
  const ShipImage({
    Key key, this.shipImage,
  }) : super(key: key);

  final String shipImage;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: -35,
      bottom: 50,
      right: -12,
      left: 12,
      child: Align(
        alignment: Alignment.topRight,
        child: Stack(
          children: [
            DropShadow(shipImage),
            Image.asset(shipImage),
          ],
        ),
      )
    );
  }
}

class ShipNameAndSize extends StatelessWidget {

  final String name;
  final String size;

  const ShipNameAndSize({Key key, this.name, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfinitySingleChildListView(text: name),
            Text(size, style: AppTextStyles.shipCardSize,),
          ],
        ),
      ),
    );
  }
}

class FactionLogo extends StatelessWidget {
  const FactionLogo({Key key, this.faction,}) : super(key: key);

  final String faction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipOval(
        child: Container(
          width: 36,
          height: 36,
          color: Colors.white,
          child: Image.asset(AppStyles.getStyle(faction).logo),
        ),
      ),
    );
  }
}

class GradientCard extends StatelessWidget {
  const GradientCard({Key key, this.faction,}) : super(key: key);

  final String faction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: AppStyles.getStyle(faction).gradient, 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 3,
            offset: Offset(3, 3),
          ),
        ],
      ),
    );
  }
}