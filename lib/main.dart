import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wings_project/api/ShipAPIReader.dart';
import 'package:wings_project/cubit/ship_cubit.dart';
import 'package:wings_project/home_page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
          create: (context) => ShipCubit(ShipAPIReader()),
          child: HomePage()
        ),
      },
    );
  }
}