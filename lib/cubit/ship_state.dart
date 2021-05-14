part of 'ship_cubit.dart';

@immutable
abstract class ShipState {
  const ShipState();
}

class ShipInitial extends ShipState {
  const ShipInitial();
}

class ShipLoading extends ShipState{
  const ShipLoading();
}

class ShipLoaded extends ShipState {
  final List<Ship> shipList;

  ShipLoaded(this.shipList);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShipLoaded &&
      other.shipList == shipList;
  }

  @override
  int get hashCode => shipList.hashCode;
}

class ShipError extends ShipState {
  final String message;
  const ShipError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ShipError &&
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
