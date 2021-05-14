import 'package:flutter/material.dart';
import 'package:wings_project/home_page/Widgets/appbar/appbar_widget.dart';
import 'package:wings_project/home_page/Widgets/body/body_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WingsAppBar(),
      body: WingsBody(),
    );
  }
}