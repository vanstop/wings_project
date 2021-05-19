import 'dart:convert';
import 'package:tuple/tuple.dart';
import 'package:flutter/services.dart';
import 'package:wings_project/src/models/ship_model.dart';
import 'package:wings_project/src/models/xwingdatamanifest_model.dart';

class ShipRepository {

  String manifestPath = 'xwing-data2/data/manifest.json';

  Future<Ship> getShip(String shipFaction, String shipName) async {
    dynamic manifestJson = jsonDecode(await rootBundle.loadString(manifestPath));
    XWingDataManifest manifest = XWingDataManifest.fromJson(manifestJson);

    String shipJsonPath = '';

    for(Pilot pilot in manifest.pilots){ 
      if(pilot.faction == shipFaction)
      {
        for(String shipPath in pilot.ships){
          if(shipPath.contains(shipName))
          {
            shipJsonPath = shipPath;
            break;
          }
        }
      }
    }

    if(shipJsonPath != '')
    {
      dynamic shipJson = jsonDecode(await rootBundle.loadString('xwing-data2/' + shipJsonPath));
      Ship ship = Ship.fromJson(shipJson);

      return ship;
    }

    return null;
  }

    Future<List<Ship>> getShipList(List<Tuple2<String, String>> shipTuples) async {

    List<Ship> shipList = [];

    for (int i = 0; i < shipTuples.length; i++) 
    {
      String shipFaction = shipTuples[i].item1;
      String shipName = shipTuples[i].item2;

      Ship currentShip = await getShip(shipFaction, shipName);
      shipList.add(currentShip);
    }

    return shipList;
  } 

}