import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wings_project/src/models/ship_model.dart';

import 'XWingDataManifest.dart';

class ShipAPIReader {

  final String prefix = 'assets/xwing-data2/';
    
  Future<Ship> getShip(String shipName) async {

    String manifestPath = prefix + 'data/manifest.json';
    dynamic manifestJson = jsonDecode(await rootBundle.loadString(manifestPath));
    XWingDataManifest manifest = XWingDataManifest.fromJson(manifestJson);

    String shipJsonPath = '';

    manifest.pilots.forEach((pilot) { 
      pilot.ships.forEach((shipPath) {
        if(shipPath.contains(shipName))
        {
          shipJsonPath = shipPath;
        }
      });
    });

    if(shipJsonPath != '')
    {
      dynamic shipJson = jsonDecode(await rootBundle.loadString(prefix + shipJsonPath));
      Ship ship = Ship.fromJson(shipJson);

      return ship;
    }

    return null;
  }

  Future<List<Ship>> getShipList(List<String> shipsNames) async {
    List<Ship> shipList = [];

    for (String shipName in shipsNames) 
    { 
      Ship currentShip = await getShip(shipName);
      shipList.add(currentShip);
    }

    return shipList;
  } 
}