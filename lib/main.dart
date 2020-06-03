import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:knowcorona/social-dist.dart';
import 'start.dart';



void main() => runApp(DevicePreview(builder: (context) => MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to KnowCorona',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SocialDistance()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        child: SafeArea(
          
          child: Center(
          child: Column(
            
            // This is the main column in the page
            
             mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // This is the first child column
                Column(
                  children: [
                    Image(
                      image: AssetImage('Images/virus.png'),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Purify \n Our Motherland \n from COVID-19',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: 'Seg',
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ), 
                  ]
                 ),
          
                 Column(children: <Widget>[
                      Stack(
                      alignment: Alignment.topCenter,
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Image(
                          image: AssetImage('Images/flagtwo.png'),
                        ),
                        Image(
                          image: AssetImage('Images/language.png'),
                        ),
                        Positioned(
                          bottom: -20,
                          child: Image(
                            image: AssetImage('Images/arrow.png'),
                          ),
                        )
                      ],
                    ),
                   SizedBox(height: 20),
                 ],),

               // This is the second child stack
                 
                   
              
              ]
              ),
        )),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
