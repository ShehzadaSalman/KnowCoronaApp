import 'package:flutter/material.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState() {
    Future.delayed(
      Duration(
        seconds: 3
      ),(){
      Navigator.pushNamed(context, '/home');
    }
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('This is the loading page'),
      ),
    );
  }
}
