import 'package:flutter/material.dart';

class SocialDistance extends StatefulWidget {
  SocialDistance({Key key}) : super(key: key);

  @override
  _SocialDistanceState createState() => _SocialDistanceState();
}

class _SocialDistanceState extends State<SocialDistance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
      child:SafeArea(
        
        child: Padding(
          padding: EdgeInsets.fromLTRB(0,10,0,10),
          child: Column(
            children: <Widget>[
            navigationTab(),
            surveyCarousel(),
            surveyInformation(),
            surveyTitleQuestion(),
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
              padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                   constraints: BoxConstraints(minHeight: 50),
                   
                   child: Text('Do not Shake hands or Hug Each Other', 
                   style: TextStyle(fontFamily: 'Seg', fontSize: 16,),
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
                   
                   child: Text('Greet Each Other with an Elbow Shake', 
                   style: TextStyle(fontFamily: 'Seg', fontSize: 16,),
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
                   style: TextStyle(fontFamily: 'Seg', fontSize: 16,),
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
                   style: TextStyle(fontFamily: 'Seg', fontSize: 16,),
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
                   style: TextStyle(fontFamily: 'Seg', fontSize: 16,),
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
  return Container(
    height: 120,
    child: Text('carousel would go here'),
  );
}

class CoronaSlider extends StatefulWidget {
  @override
  _CoronaSliderState createState() => _CoronaSliderState();
}


class _CoronaSliderState extends State<CoronaSlider> {

  double _value = 0.0;
  void _setvalue(double value) => setState(() => _value = value);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 5, 25, 0),
      child:  SliderTheme(
  data: SliderTheme.of(context).copyWith(
    activeTrackColor: Color(0xFFF58A97),
    inactiveTrackColor: Colors.grey[400],
    trackHeight: 25.0,
    thumbColor: Colors.yellow,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
    overlayColor: Colors.purple.withAlpha(32),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
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
          Image(image: AssetImage('Images/Vector.png'),),
          Image(image: AssetImage('Images/rewardtab.png'),)
          
        ],
      ),
    );
}