import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wings_project/api/Ship.dart';
import 'package:wings_project/cubit/ship_cubit.dart';
import 'listview_widget.dart';

class WingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShipCubit, ShipState>(

      listener: (context, state){
        if(state is ShipError)
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message))
          );
        }
      },

      builder: (context, state){
        if(state is ShipInitial)
        {
          List<String> shipsNames = 
          [
            "quadrijet-transfer-spacetug",
            "t-65-x-wing",
            "tie-ln-fighter",
            "fang-fighter",
            "a-sf-01-b-wing",
          ];
          updateData(context, shipsNames);
          return buildInitial();
        }
        if(state is ShipLoading)
        {
          return buildLoading();
        }
        else if (state is ShipLoaded)
        {
          return buildLoaded(state.shipList);
        }else
        {
          //(state is ShipError)
          return buildLoading();
        }
      },
    );
  }
}

Widget buildInitial(){
  return Center(
    child: Container(),
  );
}

Widget buildLoading(){
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildLoaded(List<Ship> shipList){

  return ListView(
    physics: BouncingScrollPhysics(),
    children: [
      WingsListView("Minhas Naves", shipList),
      WingsListView("Meus Esquadrões", shipList),
    ],
  );
}

void updateData(BuildContext context, List<String> shipsNames){
  final shipCubit = context.read<ShipCubit>();
  shipCubit.fetchShipList(shipsNames);
}

