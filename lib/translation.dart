import 'package:flutter/material.dart';

class Translate extends StatefulWidget {
  Translate({Key key}) : super(key: key);

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Text('Name: Shahzada Muhamad Salman',
                style: TextStyle(fontSize: 22)),
            Text('Attribute: Legend', style: TextStyle(fontSize: 22)),
            Text('Skills: The Legendary Swords Master',
                style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
