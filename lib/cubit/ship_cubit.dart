import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wings_project/api/Ship.dart';
import 'package:wings_project/api/ShipAPIReader.dart';

part 'ship_state.dart';

class ShipCubit extends Cubit<ShipState> {
  final ShipAPIReader _shipAPIReader;
  ShipCubit(this._shipAPIReader) : super(ShipInitial());

  Future<void> fetchShipList(List<String> shipsNames) async{
      emit(ShipLoading());
      List<Ship> shipList = [];

      shipList = await _shipAPIReader.getShipList(shipsNames);
      
      emit(ShipLoaded(shipList));
  }
}
