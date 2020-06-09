import 'package:flutter/material.dart';


class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image(image: AssetImage('Images/Group.png'),),
                        ),
                      ]
                  ),
                  SizedBox(height: 20),
                  Text('CONGRATULATIONS! \n You are now a',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Seg',
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('COVID-Lieutenant',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'Seg',
                        color: Color(0xFF2F80ED),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20),

                  Text('7/10', style: TextStyle(
                    fontFamily: 'Seg',
                    color: Color(0xFF219653),
                    fontSize: 39,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text('Correct guesses', style: TextStyle(
                    fontFamily: 'Seg',
                    color: Color(0xFF27AE60),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child:  Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 21 ),
                                  children: [
                                    TextSpan(text: 'Lieutenant\n', style: TextStyle(
                                      color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                    )),
                                    TextSpan(text: 'Your advanced knowledge allows you to protect yourself and others')
                                  ]
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                              image: AssetImage('Images/new-badge.png')
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child:  Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 17 ),
                                  children: [
                                    TextSpan(text: '', style: TextStyle(
                                      color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                    )),
                                    TextSpan(text: 'Download this badge to your phone')
                                  ]
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                              image: AssetImage('Images/green-badge.png')
                          ),
                        ),

                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child:  Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 17 ),
                                  children: [
                                    TextSpan(text: '', style: TextStyle(
                                      color: Color(0xFF2F80ED), fontWeight: FontWeight.bold,
                                    )),
                                    TextSpan(text: 'Add this Official Badge to your Facebook profile picture')
                                  ]
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                              image: AssetImage('Images/facebook-badge.png')
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 30),


                ]

            ),
          ),
        ),
      ),
    );


  }
}
