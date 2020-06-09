import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'SurveyTitle.dart';




class WashingHands extends StatefulWidget {
  @override
  _WashingHandsState createState() => _WashingHandsState();
}

class _WashingHandsState extends State<WashingHands> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  SingleChildScrollView(
            child:SafeArea(

              child: Padding(
                padding: EdgeInsets.fromLTRB(0,10,0,10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () { Navigator.pop(context); },
                            child: Image(image: AssetImage('Images/Vector.png'),),
                          ),
                          GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context, '/survivor');
                              },
                              child: Image(image: AssetImage('Images/rewardtab.png'),)
                          )

                        ],
                      ),
                    ),
                    SizedBox(height:10),
                    surveyCarousel(),
                    SizedBox(height:30),
                    surveyInformation(),
                    SizedBox(height: 20),

                    Padding(padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                      child: Text('1. ______ your hands with clean, running water (warm or cold), turn off the tap, and apply soap. ',
                        style: TextStyle(fontSize: 22, fontFamily: 'Seg'),),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('A. Rinse',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('B. Wet',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('C. Dry',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('D. Scrub',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('E. Later',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                            ]
                        )
                    ),

                    SizedBox(height: 30),
                    Center(
                      child: RaisedButton(
                          color: Color(0xFFBDBDBD),
                          elevation: 0,
                          padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text('Submit' , style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,

                          ),),

                          onPressed: (){}
                      ),
                    ),
                    SizedBox(height:40),

                    // This is the second question

                    Padding(padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                      child: Text('2. ______ your hands by rubbing them together with the soap. Lather the backs of your hands, between your fingers, and under your nails. ',
                        style: TextStyle(fontSize: 22, fontFamily: 'Seg'),),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('A. Rinse',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('B. Wet',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('C. Dry',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('D. Scrub',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('E. Later',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                            ]
                        )
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: RaisedButton(
                          color: Color(0xFFBDBDBD),
                          elevation: 0,
                          padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text('Submit' , style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,

                          ),),

                          onPressed: (){}
                      ),
                    ),
                    SizedBox(height:40),
                    // This is the second question

                    Padding(padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                      child: Text('3. ______ every finger and under each nail individually until seeing lather on all of them.. ',
                        style: TextStyle(fontSize: 22, fontFamily: 'Seg'),),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('A. Rinse',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('B. Wet',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('C. Dry',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('D. Scrub',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('E. Later',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                            ]
                        )
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: RaisedButton(
                          color: Color(0xFFBDBDBD),
                          elevation: 0,
                          padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text('Submit' , style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,

                          ),),

                          onPressed: (){}
                      ),
                    ),
                    SizedBox(height:40),

                    Padding(padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
                      child: Text('4. ______ your hands well under clean, running water. ',
                        style: TextStyle(fontSize: 22, fontFamily: 'Seg'),),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('A. Rinse',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('B. Wet',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('C. Dry',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('D. Scrub',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                              SizedBox(height:15),
                              Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                constraints: BoxConstraints(
                                  minHeight: 45,
                                  minWidth: 170,
                                ),

                                child: Text('E. Later',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 16,),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(5.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],


                                ),

                              ),
                            ]
                        )
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: RaisedButton(
                          color: Color(0xFFBDBDBD),
                          elevation: 0,
                          padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text('Submit' , style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,

                          ),),

                          onPressed: (){}
                      ),
                    ),
                    SizedBox(height:40),





                  ],
                ),
              ),
              // *? Padding ends here
            )
          // *? Safa Area ends gere
        )

    );

  }
}



Widget surveyCarousel(){
  int _current = 0;
  List<SurveyTitle> surveylist = [
    SurveyTitle('Washing Hands', 1, '/washing'),
    SurveyTitle('Stay Hydrated',0, '/hydration'),
    SurveyTitle('Social Distancing',0, '/survey'),
    SurveyTitle('Sneeze Cough',0, '/sneeze'),
    SurveyTitle('Tissue Handling', 0, '/tissue')

  ];
  List<String> surveys = ['Social Distancing' , 'Sneeze Cough', 'Sneeze Cough' , 'Hydrated'];
  return Container(
      child: CarouselSlider(
        items: surveylist.map((i) {
          return Builder(
            builder: (BuildContext context) {

              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '${i.route}');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  alignment: Alignment(0.0, 0.0),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color:  _current == i.pagenumber
                        ? Color(0xFFE3E6EC)
                        : Color(0xFF2F80ED),

                    borderRadius:  BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Text('${i.title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w600,

                        color: _current == i.pagenumber
                            ? Color(0xFF4F4F4F)
                            : Color(0xFFF5f5f5),
                        fontFamily: 'Seg'
                    ),

                  ),
                ),
              );


            },
          );
        }).toList(),
        options: CarouselOptions(
          height: 110.0,
          enlargeCenterPage: true,
          viewportFraction: 0.5,


        ),
      )
  );
}


// *? This is the Survey Information Widget

Widget surveyInformation(){
  return  Container(
    padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(image: AssetImage('Images/Group 91.png'),),
        SizedBox(height:30),
        Text('Can you guess the 5-step process for the COVID-destroyer hand wash?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 21,
            fontFamily: 'Seg',
            fontWeight: FontWeight.w500,
            color: Color(0xFF2D9CDB),
          ),)
      ],
    ),
  );
}



// *? This is the navigation widget

Widget navigationTab(){

  return Container(
    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        GestureDetector(
          onTap: (){

            print('Going to the back page');
          },
          child: Image(image: AssetImage('Images/Vector.png'),),
        ),
        Image(image: AssetImage('Images/rewardtab.png'),)
      ],
    ),
  );
}
