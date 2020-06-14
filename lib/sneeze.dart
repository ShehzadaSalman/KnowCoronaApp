import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'SurveyTitle.dart';
import 'QuizHelper.dart';
import 'package:http/http.dart' as http;

class Sneeze extends StatefulWidget {
  @override
  _SneezeState createState() => _SneezeState();
}

class _SneezeState extends State<Sneeze> {

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
        print('Correct answer'); }
      else { print('Wrong Answer');}
    }
    );
  }

  var optionColor = false;

  Color c = Colors.grey[300];


  @override
  Widget build(BuildContext context) {
    if(quizHelper != null) {
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
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: quizHelper.results.length,
                            itemBuilder: (context, index){
                              return Container(
                                  margin: EdgeInsets.only(bottom: 50),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(quizHelper.results[index].question,
                                        style: TextStyle(
                                            fontSize: 20, fontFamily: 'Seg'
                                        ),
                                      ),
                                      SizedBox(height:10),
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: quizHelper.results[index].incorrectAnswers.map((f){
                                            return SizedBox(
                                              width: double.infinity,
                                              child: RaisedButton(
                                                padding: EdgeInsets.symmetric(vertical: 12),
                                                onPressed: (){
                                                  checkAnswer(f);
                                                },
                                                elevation: 0,
                                                child: Text(f),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      // The submit button comes here
                                      SizedBox(height:10),
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

                                    ],
                                  )
                              );
                            },
                          )
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
    else{
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




  }
}


Widget surveyCarousel(){
  int _current = 0;
  List<SurveyTitle> surveylist = [
    SurveyTitle('Sneeze Cough',1, '/sneeze'),
    SurveyTitle('Tissue Handling',0, '/tissue'),
    SurveyTitle('Stay Hydrated',0, '/hydration'),
    SurveyTitle('Social Distancing',0, '/survey'),
    SurveyTitle('Washing Hands', 0, '/washing'),

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
        Image(image: AssetImage('Images/Group-1.png'),),
        SizedBox(height:30),
        Text('The best way to protect others is to know how to sneeze or cough during the pandemic..',
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

