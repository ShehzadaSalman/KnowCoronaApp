import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
        
           // *? This is the Column A
          child: Column(
            
              children: [
                //*? This is the Child A-1 */
                Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[       
                   Image(
                      height: 50,
                    image: AssetImage('Images/language.png'),
                          ),
                 
                  SizedBox(width: 10),
                  ]
                ),
               
               // *? This is child  Column A-2
                
                Expanded(
                  child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // *? This is the child column A-2.1
                   Container(child:Column(
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
                ),
               
                   // *? This is the child column A-2.2
                 Container(
                   child:   Column(
                     children: <Widget>[
  
                    InkWell(   
                  borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                  ),
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 0),
                    padding: EdgeInsets.fromLTRB(10, 24, 10, 24),
                    child: Center(
                      child: Text(
                        "Resist",
                        style: TextStyle(
                          fontFamily: "Seg",
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          inherit: false,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF6FCF97),
                      borderRadius: BorderRadius.all(
                        Radius.circular(17.0),
                      ),
                      boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    
                    
                    ),
                  ),
                ),
                 SizedBox(height:10),
                  
                  InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 0),
                    padding: EdgeInsets.fromLTRB(10, 24, 10, 24),
                    child: Center(
                      child: Text(
                        "Inspire",
                        style: TextStyle(
                          fontFamily: "Seg",
                          fontSize: 30.0,
                          color: Color(0xFF6FCF97),
                          fontWeight: FontWeight.bold,
                          inherit: false,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(17.0),
                      ),
                      boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    
                    
                    ),
                  ),
                )
                     ],
                   ),
                 
                 ),


                
                  
                  // *? This is the child column of A-2.3
                  Container(
                    child:  InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 40, 0),
                    padding: EdgeInsets.fromLTRB(10, 20, 5, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // *? This is the data api

                        Column(
                       mainAxisAlignment: MainAxisAlignment.start, 
                       crossAxisAlignment: CrossAxisAlignment.start,  
                          children: <Widget>[      
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17
                            ),
                            children: <TextSpan>[
                             TextSpan(text: 'Active: ',
                             style: TextStyle(
                               color: Colors.black,
                             )),
                             TextSpan(text: '3,902 ',
                             style: TextStyle(
                             color: Color(0xFFF2994A),
                             fontWeight: FontWeight.bold
                             )),
                             TextSpan(text: '/4695',
                             style: TextStyle(
                               fontSize: 10
                             )
                             
                             )

                            ]
                          ) 
                        ),
                        SizedBox(height:10),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17
                            ),
                            children: <TextSpan>[
                             TextSpan(text: 'Deaths: ',
                             style: TextStyle(
                               color: Colors.black,
                             ),
                             ),
                             TextSpan(text: '66 ',
                             style: TextStyle(
                             color: Color(0xFFFEB5757),
                             fontWeight: FontWeight.bold
                             )),
                             TextSpan(text: '(6.05%)',
                             style: TextStyle(
                               fontSize: 10
                             )
                             
                             )

                            ]
                          ) 
                        ),
                      SizedBox(height:10),
                         RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17
                            ),
                            children: <TextSpan>[
                             TextSpan(text: 'Recoveries: ',
                             style: TextStyle(
                               color: Colors.black,
                             ),
                             ),
                             TextSpan(text: '727 ',
                             style: TextStyle(
                             color: Color(0xFFFEB5757),
                             fontWeight: FontWeight.bold
                             )),
                             TextSpan(text: '(22.16%)',
                             style: TextStyle(
                               fontSize: 10
                             )        
                             )
                            ]
                          ) 
                        ),
                        ],
                        ),
                        
                        // *? This is the Pakistan flag
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Image(
                              height: 80,
                              image: AssetImage('Images/Vector-2.png',                            
                            ),
                            )
                          ]
                         
                        ),
                      ]
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(17.0),
                      ),
                      
                    ),
                  ),
                )
                  )
                  
                  ] ),
                 ),
                   // *? The child column A-2 ends here
              ]
              ),
              // *? First PArent Column A-1 ends here
        )),
     
    );
  }
}
