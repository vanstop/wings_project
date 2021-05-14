import 'package:flutter/material.dart';
import '../app_text_styles.dart';

class InfinitySingleChildListView extends StatefulWidget {
  final String text;

  const InfinitySingleChildListView({Key key, this.text}) : super(key: key);

  @override
  _InfinitySingleChildListViewState createState() => _InfinitySingleChildListViewState(text);
}

class _InfinitySingleChildListViewState extends State<InfinitySingleChildListView> {

  ScrollController _scrollController = new ScrollController();
  final String text;

  _InfinitySingleChildListViewState(this.text);

  @override
  void initState(){
    super.initState();
    
    _scrollController.addListener(() {
      if(_scrollController.position.pixels <= _scrollController.position.minScrollExtent)
      {       
        animateToEnd();
      }
      
      double scrollLenght = _scrollController.position.extentAfter + _scrollController.position.extentInside + _scrollController.position.extentBefore;
      if(_scrollController.position.pixels >= scrollLenght)
      {
        animateToStart();
      }
    });

    animateToEnd();
  }

  void animateToEnd() async {
    await Future.delayed(Duration(seconds: 1));
    if(_scrollController.position.extentAfter > 0)
    {
      double scrollLenght = _scrollController.position.extentAfter + _scrollController.position.extentInside + _scrollController.position.extentBefore;
      _scrollController.animateTo(scrollLenght, duration: Duration(milliseconds: 5000), curve: Curves.ease);
    }
  }

  void animateToStart() async {
    await Future.delayed(Duration(seconds: 0));
    _scrollController.animateTo(0, duration: Duration(milliseconds: 5000), curve: Curves.ease);
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Text(text, style: AppTextStyles.shipCardName)
    );
  }
}