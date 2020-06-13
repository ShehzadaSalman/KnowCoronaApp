import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SurvivorOverview extends StatelessWidget {
  const SurvivorOverview({Key key}) : super(key: key);

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
                  Text('Guess all the Tips to fight COVID-19 and discover what type of survivor you are',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: 'Seg',
                        color: Color(0xFF333333),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    runSpacing: 20.0,
                    children: <Widget>[
                      coronaBadges('Images/Group-2.png', 1),
                      coronaBadges('Images/Group-91.png', 0),
                      coronaBadges('Images/Group-93.png', 0),
                      coronaBadges('Images/Group-90.png', 1),
                      coronaBadges('Images/Group-1.png', 1),
                    ],
                  ),
                  SizedBox(height: 35),
                  Text('3/5', style: TextStyle(
                    fontFamily: 'Seg',
                    color: Color(0xFF4F4F4F),
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child:  Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 18 ),
                                  children: [
                                    TextSpan(text: 'Trooper\n', style: TextStyle(
                                      color: Color(0xFF219653), fontWeight: FontWeight.bold,
                                    )),
                                    TextSpan(text: 'You know the basics about the virus and can protect yourself from getting it')
                                  ]
                              ),

                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                              height: 100,
                              image: AssetImage('Images/ArmyBadge1.png')
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child:  Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 18 ),
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
                              height: 100,
                              image: AssetImage('Images/ArmyBadge2.png')
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child:  Container(
                            child: RichText(
                              text: TextSpan(
                                  style: TextStyle( color: Color(0xFF333333), fontFamily: 'Seg', fontSize: 18 ),
                                  children: [
                                    TextSpan(text: 'General\n', style: TextStyle(
                                      color: Color(0xFF9B51E0), fontWeight: FontWeight.bold,
                                    )),
                                    TextSpan(text: 'Your perfect scores make you the best living weapon against COVID-19')
                                  ]
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Image(
                              height: 100,
                              image: AssetImage('Images/ArmyBadge3.png')
                          ),
                        ),

                      ],
                    ),
                  ),



                ]

            ),
          ),
        ),
      ),
    );


  }
}

Widget coronaBadges(String imgAddress, int borderColor){
    int _decidecolor = 0;
  return  Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    height: 55,
    width: 85,
    child: Image(image: AssetImage(imgAddress),),
    decoration: BoxDecoration(
      color: Color(0xFFE3E6EC),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color:
            _decidecolor == borderColor
                ? Color(0xFFE3E6EC)
                : Color(0xFF6FCF97),
            spreadRadius: 3),
      ],

    ),
  );

}