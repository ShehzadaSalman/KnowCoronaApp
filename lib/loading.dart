import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:knowcorona/main.dart';

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
      Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      )
      );
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image(image: AssetImage('Images/flagtwo.png')),
        ),

      ),
    );
  }
}
