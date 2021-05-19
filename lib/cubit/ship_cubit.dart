import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuple/tuple.dart';
import 'package:wings_project/src/models/ship_model.dart';
import 'package:wings_project/src/repositories/ship_repository.dart';

part 'ship_state.dart';

class ShipCubit extends Cubit<ShipState> {
  final ShipRepository _repository;
  ShipCubit(this._repository) : super(ShipInitial());

  Future<void> fetchShipList(List<Tuple2<String, String>> shipTuples) async{
      emit(ShipLoading());
      List<Ship> shipList = [];
      shipList = await _repository.getShipList(shipTuples);
      emit(ShipLoaded(shipList));
  }
}
