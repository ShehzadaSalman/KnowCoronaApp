import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'SurveyTitle.dart';
import 'QuizHelper.dart';
import 'package:http/http.dart' as http;



class Hydration extends StatefulWidget {
  @override
  _HydrationState createState() => _HydrationState();
}

class _HydrationState extends State<Hydration> {

  // we do all the here before the app is started

  String apiURL = "https://opentdb.com/api.php?amount=10&category=15&type=multiple";

  QuizHelper quizHelper;

  int quizIndex = 0;
  @override
  void initState(){

    // do something here
    fetchQuiz();
    super.initState();

  }




  fetchQuiz() async{
    // get the response from the api
    var response = await http.get(apiURL);
    // get the body part from the api request
    var body = response.body;

    // decode the json request
    var json = jsonDecode(body);
    // set State to create a QuizHelper class object from the json.
    setState(() {
      quizHelper = QuizHelper.fromJson(json);
      quizHelper.results[0].incorrectAnswers.add(
          quizHelper.results[0].correctAnswer
      );

      quizHelper.results[0].incorrectAnswers.shuffle();

    });

  }

  // The method to check the right answer of the quiz
  checkAnswer(answer){
    String correctAnswer = quizHelper.results[0].correctAnswer;
    setState(() {
      if(correctAnswer == answer){
        c = Colors.black; }
      else { c = Colors.blue; }
    });
  }

  var optionColor = false;

  Color c = Colors.grey[300];

  @override
  Widget build(BuildContext context) {
    if(quizHelper != null){

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
                      ListView.builder(
                        itemCount: quizHelper.results.length,
                        itemBuilder: (context, index){
                          return Card(

                            child: ListTile(
                              onTap: (){},
                              title: Text(quizHelper.results[index].question),
                            ),
                          );
                        },
                      ),
                      SizedBox(height:40),
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

    }else{
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
                      SizedBox(height: 50),
                      Center(
                        child: CircularProgressIndicator(),
                      )





                    ],
                  ),
                ),
                // *? Padding ends here
              )
            // *? Safa Area ends gere
          )

      );

    }


    // Build Widget ends here
  }
}

List<String> theItems = ['one','two', 'three', 'four'];

ListView questionaire(theItems){
  return  ListView.builder(
      itemCount: theItems.length,
      itemBuilder: (context, index){
        return Container(
          child: Text('hello'),
        );
      }
  );
}



Widget surveyCarousel(){
  int _current = 0;
  List<SurveyTitle> surveylist = [

    SurveyTitle('Stay Hydrated',1, '/hydration'),
    SurveyTitle('Social Distancing',0, '/survey'),
    SurveyTitle('Sneeze Cough',0, '/sneeze'),
    SurveyTitle('Washing Hands', 0, '/washing'),
    SurveyTitle('Tissue Handling',0, '/tissue'),
  ];


  List<String> surveys = ['Social Distancing' , 'Sneeze Cough', 'Sneeze Cough' , 'Hydrated'];
  return Container(
      child: CarouselSlider(
        items: surveylist.map((i) {
          return Builder(
            builder: (BuildContext context) {

              return InkWell(
                onTap: (){
                  Navigator.pushReplacementNamed(context, '${i.route}');
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
        Image(image: AssetImage('Images/Group-90.png'),),
        SizedBox(height:30),
        Text('Keeping yourself hydrated strengthens your immune system for COVID-19.',
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

Widget optionWidget(){
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Column(
      children: quizHelper.results[index].incorrectAnswers.map((f){

        return Text('hello world');

      }).toList(),
    ),
  );
}













