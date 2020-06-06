import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'SurveyTitle.dart';



class Hydration extends StatefulWidget {
  @override
  _HydrationState createState() => _HydrationState();
}

class _HydrationState extends State<Hydration> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  SingleChildScrollView(
            child:SafeArea(

              child: Padding(
                padding: EdgeInsets.fromLTRB(0,10,0,10),
                child: Column(

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
                    surveyTitleQuestion(),
                    SizedBox(height: 40),
                    Container(width: 350,
                        child:   Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(6, (index) => Text("${index}m",
                                  style: TextStyle(
                                      fontSize: 16, fontWeight:FontWeight.bold, fontFamily: 'Seg',
                                      color: Color(0xFF828282)
                                  )
                              ),
                              )),
                        )
                    ),

                    CoronaSlider(),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child:  Text('Move the Bar to Indicate your \nbest guess for this tip.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          fontFamily: 'Seg',
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF2D9CDB),
                        ),
                      ),
                    ),
                    SizedBox(height:10),
                    Container(
                      child: RaisedButton(
                          color: Color(0xFF56CCF2),
                          elevation: 8,
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
                    SizedBox(height: 50),
                    Padding(padding: EdgeInsets.fromLTRB(25, 15, 25, 10),

                      child: Text('2. Something else to consider for Social Distancing is to ____________.',
                        style: TextStyle(fontSize: 22, fontFamily: 'Seg'),),
                    ),

                    Container(
                        padding: EdgeInsets.fromLTRB(25, 25, 60, 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                constraints: BoxConstraints(minHeight: 50),

                                child: Text('Do not Shake hand or Hug Each Other',
                                  style: TextStyle(fontFamily: 'Seg',
                                    fontSize: 15,),
                                ),
                                alignment: Alignment(0.0, 0.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:  BorderRadius.all( Radius.circular(10.0)),
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
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                constraints: BoxConstraints(minHeight: 50),

                                child: Text('Greet Each Other with an Elbow Shake',
                                  style: TextStyle(fontFamily: 'Seg', fontSize: 15,),
                                ),
                                alignment: Alignment(0.0, 0.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
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
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                constraints: BoxConstraints(minHeight: 50),

                                child: Text('Avoid going to large gatherings or Aggregations',
                                  style: TextStyle(fontFamily: 'Seg', fontSize: 15,),
                                ),
                                alignment: Alignment(0.0, 0.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
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
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                constraints: BoxConstraints(minHeight: 50),
                                child: Text('Wear a face mask to protect others',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontFamily: 'Seg', fontSize: 15,),
                                ),
                                alignment: Alignment(0.0, 0.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
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
                                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                constraints: BoxConstraints(minHeight: 50),

                                child: Text('Avoid going out as much as possible',
                                  style: TextStyle(fontFamily: 'Seg', fontSize: 15,),
                                ),
                                alignment: Alignment(0.0, 0.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
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

                    SizedBox(height:40),
                    Container(
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
    SurveyTitle('Hydration',1, '/hydration'),
    SurveyTitle('Social Distancing',0, '/survey'),
    SurveyTitle('Sneeze Cough',0, '/sneeze'),

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
                        fontSize: 23.0,
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

class CoronaSlider extends StatefulWidget {
  @override
  _CoronaSliderState createState() => _CoronaSliderState();
}


class _CoronaSliderState extends State<CoronaSlider> {

  double _value = 0.1;

  void _setvalue(double value) => setState(() => _value = value);


  @override
  Widget build(BuildContext context) {

    return Container(
      width: 320.0,
      padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
      child:  SliderTheme(
        data: SliderTheme.of(context).copyWith(
          activeTrackColor: Color(0xFFF58A97),
          inactiveTrackColor: Colors.grey[400],
          trackHeight: 25.0,
          thumbColor: Color(0xFFF58A97),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
          overlayColor: Colors.purple.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
        ),
        child: Slider(
            value: _value,
            divisions: 5,
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            }

        ),
      ),
    );
  }
}

// *? This is the Survey general question
Widget surveyTitleQuestion(){
  return   Padding(padding: EdgeInsets.fromLTRB(25, 15, 25, 10),

    child: Text('1. COVID-19 can spread by tiny droplets from the infected person travelling up to 2-3 meters \n \nKeep a distance of at least ____ meters when you meet someone. ',
      style: TextStyle(fontSize: 22, fontFamily: 'Seg'),),
  );
}

// *? This is the Survey Information Widget

Widget surveyInformation(){
  return  Container(
    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image(image: AssetImage('Images/Group-2.png'),),
        SizedBox(height:30),
        Text('Social Distancing is the best \n way to STOP the disease.',
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