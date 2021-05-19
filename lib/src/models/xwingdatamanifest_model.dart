class XWingDataManifest {
  String version;
  List<String> damagedecks;
  List<String> factions;
  List<String> stats;
  List<String> actions;
  List<Pilot> pilots;
  List<String> upgrades;
  String conditions;
  List<String> quickBuilds;

  XWingDataManifest({
      this.version,
      this.damagedecks,
      this.factions,
      this.stats,
      this.actions,
      this.pilots,
      this.upgrades,
      this.conditions,
      this.quickBuilds});

  XWingDataManifest.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    damagedecks = json['damagedecks'].cast<String>();
    factions = json['factions'].cast<String>();
    stats = json['stats'].cast<String>();
    actions = json['actions'].cast<String>();
    if (json['pilots'] != null) {
      pilots = [];
      json['pilots'].forEach((v) {
        pilots.add(new Pilot.fromJson(v));
      });
    }
    upgrades = json['upgrades'].cast<String>();
    conditions = json['conditions'];
    quickBuilds = json['quick-builds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['damagedecks'] = this.damagedecks;
    data['factions'] = this.factions;
    data['stats'] = this.stats;
    data['actions'] = this.actions;
    if (this.pilots != null) {
      data['pilots'] = this.pilots.map((v) => v.toJson()).toList();
    }
    data['upgrades'] = this.upgrades;
    data['conditions'] = this.conditions;
    data['quick-builds'] = this.quickBuilds;
    return data;
  }
}

class Pilot {
  String faction;
  List<String> ships;

  Pilot({this.faction, this.ships});

  Pilot.fromJson(Map<String, dynamic> json) {
    faction = json['faction'];
    ships = json['ships'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faction'] = this.faction;
    data['ships'] = this.ships;
    return data;
  }
}
