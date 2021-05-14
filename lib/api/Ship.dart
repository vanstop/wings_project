class Ship {
  String name;
  String xws;
  int ffg;
  String size;
  List<String> dial;
  List<String> dialCodes;
  String faction;
  List<Stats> stats;
  List<Actions> actions;
  String icon;
  List<Pilots> pilots;

  Ship(
      {this.name,
      this.xws,
      this.ffg,
      this.size,
      this.dial,
      this.dialCodes,
      this.faction,
      this.stats,
      this.actions,
      this.icon,
      this.pilots});

  Ship.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    xws = json['xws'];
    ffg = json['ffg'];
    size = json['size'];
    dial = json['dial'].cast<String>();
    if(json['dialCodes'] != null){
      dialCodes = json['dialCodes'].cast<String>();
    }
    faction = json['faction'];
    if (json['stats'] != null) {
      stats = [];
      json['stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }
    if (json['actions'] != null) {
      actions = [];
      json['actions'].forEach((v) {
        actions.add(new Actions.fromJson(v));
      });
    }
    icon = json['icon'];
    if (json['pilots'] != null) {
      pilots = [];
      json['pilots'].forEach((v) {
        pilots.add(new Pilots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['xws'] = this.xws;
    data['ffg'] = this.ffg;
    data['size'] = this.size;
    data['dial'] = this.dial;
    data['dialCodes'] = this.dialCodes;
    data['faction'] = this.faction;
    if (this.stats != null) {
      data['stats'] = this.stats.map((v) => v.toJson()).toList();
    }
    if (this.actions != null) {
      data['actions'] = this.actions.map((v) => v.toJson()).toList();
    }
    data['icon'] = this.icon;
    if (this.pilots != null) {
      data['pilots'] = this.pilots.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stats {
  String arc;
  String type;
  int value;

  Stats({this.arc, this.type, this.value});

  Stats.fromJson(Map<String, dynamic> json) {
    arc = json['arc'];
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arc'] = this.arc;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class Actions {
  String difficulty;
  String type;

  Actions({this.difficulty, this.type});

  Actions.fromJson(Map<String, dynamic> json) {
    difficulty = json['difficulty'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['difficulty'] = this.difficulty;
    data['type'] = this.type;
    return data;
  }
}

class Pilots {
  String name;
  String caption;
  int initiative;
  int limited;
  int cost;
  String xws;
  String ability;
  String image;
  ShipAbility shipAbility;
  List<String> slots;
  String artwork;
  int ffg;
  bool hyperspace;
  String text;
  List<String> keywords;

  Pilots(
      {this.name,
      this.caption,
      this.initiative,
      this.limited,
      this.cost,
      this.xws,
      this.ability,
      this.image,
      this.shipAbility,
      this.slots,
      this.artwork,
      this.ffg,
      this.hyperspace,
      this.text,
      this.keywords});

  Pilots.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    caption = json['caption'];
    initiative = json['initiative'];
    limited = json['limited'];
    cost = json['cost'];
    xws = json['xws'];
    ability = json['ability'];
    image = json['image'];
    shipAbility = json['shipAbility'] != null
        ? new ShipAbility.fromJson(json['shipAbility'])
        : null;
    slots = json['slots'].cast<String>();
    artwork = json['artwork'];
    ffg = json['ffg'];
    hyperspace = json['hyperspace'];
    text = json['text'];
    keywords = json['keywords'] != null 
        ? json['keywords'].cast<String>() 
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['caption'] = this.caption;
    data['initiative'] = this.initiative;
    data['limited'] = this.limited;
    data['cost'] = this.cost;
    data['xws'] = this.xws;
    data['ability'] = this.ability;
    data['image'] = this.image;
    if (this.shipAbility != null) {
      data['shipAbility'] = this.shipAbility.toJson();
    }
    data['slots'] = this.slots;
    data['artwork'] = this.artwork;
    data['ffg'] = this.ffg;
    data['hyperspace'] = this.hyperspace;
    data['text'] = this.text;
    data['keywords'] = this.keywords;
    return data;
  }
}

class ShipAbility {
  String name;
  String text;

  ShipAbility({this.name, this.text});

  ShipAbility.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['text'] = this.text;
    return data;
  }
}