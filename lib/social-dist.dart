import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SurveyTitle.dart';
import 'QuizHelper.dart';
import 'package:http/http.dart' as http;

class SocialDistance extends StatefulWidget {
  SocialDistance({Key key}) : super(key: key);

  @override
  _SocialDistanceState createState() => _SocialDistanceState();
}

class _SocialDistanceState extends State<SocialDistance> {
  String apiURL = "https://shahzada.website/covid/public/social";

  List<String> answerSelected;
  List<bool> submitEnabled;
  List<bool> submitPressed;
  List<bool> questionAttempted;

  bool socialDistanceCompleted = false;
  int correctAttempted = 0;
  double socialDistanceMarks = 0.0;
  SharedPreferences sharedPreferences;

  QuizHelper quizHelper;

  int quizIndex = 0;
  @override
  void initState(){
    answerSelected = List();
    submitEnabled = List();
    submitPressed = List();
    questionAttempted = List();

    // do something here
    fetchQuiz();
    initializeSharedPreferences();
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
      quizHelper.results.forEach((results) {
        results.incorrectAnswers.add(
            results.correctAnswer
        );
        results.incorrectAnswers.shuffle();
        answerSelected.add('');
        submitEnabled.add(false);
        submitPressed.add(false);
        questionAttempted.add(false);
      });
//      quizHelper.results[0].incorrectAnswers.add(
//          quizHelper.results[0].correctAnswer
//      );
//      quizHelper.results[0].incorrectAnswers.shuffle();
    });
  }

  // The method to check the right answer of the quiz
  bool checkAnswer(answer, index){
    bool isAnswerCorrect = false;
    String correctAnswer = quizHelper.results[index].correctAnswer;
    setState(() {
      if(correctAnswer == answer){
        print('Correct answer');
        isAnswerCorrect = true;
      }
      else {
        print('Wrong Answer');
      }
    });
    return isAnswerCorrect;
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
                      surveyTitleQuestion(),
                      SizedBox(height: 40),
                      Center(
                          child:   Container(
                            width: 280,
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
                          child: Center(
                            child: Text('Move the Bar to Indicate your \nbest guess for this tip.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 21,
                                fontFamily: 'Seg',
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF2D9CDB),
                              ),
                            ),
                          )
                      ),
                      SizedBox(height:10),

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
                                          children: quizHelper.results[index].incorrectAnswers.map((f){
                                            Color color;
                                            if(submitPressed[index]){
                                              f.compareTo(quizHelper.results[index].correctAnswer) == 0
                                                  ? color = Color(0xFF6FCF97) :
                                              f.compareTo(answerSelected[index]) == 0
                                                  ? color = Color(0xFFF58A97) : color = null;
                                            } else{
                                              f.compareTo(answerSelected[index]) == 0
                                                  ? color = Color(0xFF56CCF2) : color = null;
                                            }
                                            return SizedBox(
                                              width: double.infinity,
                                              child: RaisedButton(
                                                color: color,
                                                padding: EdgeInsets.symmetric(vertical: 12),
                                                onPressed: (){
                                                  setState(() {
                                                    if(questionAttempted[index]){
                                                      // do nothing; question already attempted
                                                    } else{
                                                      answerSelected[index] = f;
                                                      submitEnabled[index] = true;
                                                    }
                                                  });
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
                                        child: submitEnabled[index] ?
                                        RaisedButton(
                                            color: Color(0xFF56CCF2),
                                            elevation: 0,
                                            padding: EdgeInsets.fromLTRB(50, 14, 50, 14),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: Text('Submit' , style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,

                                            ),),

                                            onPressed: (){
                                              setState(() {
                                                if(checkAnswer(answerSelected[index], index)){
                                                  correctAttempted++;
                                                  print(correctAttempted);
                                                }
                                                submitEnabled[index] = false;
                                                submitPressed[index] = true;
                                                questionAttempted[index] = true;
                                                if(checkAllQuestionsAttempted()){
                                                  print('All question attemped of current quiz.');
                                                  print('Correct attempted: ' + correctAttempted.toString());
                                                  socialDistanceMarks = ((correctAttempted/quizHelper.results.length)*(100))*(2/100); // "2" here being the total marks of section
                                                  print('Marks from this section: ' + socialDistanceMarks.toString());
                                                  print('Saving data socialDistanceMarks...');
                                                  saveToSharedPreferences();
                                                  print('Data saved!');
                                                  final snackBar = SnackBar(content: Text('Congratulations! You have Completed the Social Distancing Section'));

                                                  // Find the Scaffold in the widget tree and use it to show a SnackBar.
                                                  Scaffold.of(context).showSnackBar(snackBar);

                                                }
                                              });
                                            }
                                        ) :
                                        RaisedButton(
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

                                            onPressed: (){
                                              // do nothing; no answer selected
                                            }
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

    }else {
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


  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    socialDistanceCompleted = sharedPreferences.getBool('socialDistanceCompleted');
    socialDistanceMarks = sharedPreferences.getDouble('socialDistanceMarks');
    print('socialDistanceCompleted - from SharedPreferences : ' + socialDistanceCompleted.toString());
    if(socialDistanceCompleted != null && socialDistanceCompleted){
      print('Section already completed');
      print('Marks obtained in Social Distancing section: ' + socialDistanceMarks.toString());
    }
  }

  void saveToSharedPreferences() async {
    await sharedPreferences.setBool('socialDistanceCompleted', true);
    await sharedPreferences.setDouble('socialDistanceMarks', socialDistanceMarks);
    if(checkAllSectionsCompleted()){
      // this if body will run only when all 5 sections are completed.
      // this check tells whether all sections are completed or not
      print('All five sections completed.');
      calculateAndSaveTotal();
    }
  }

  bool checkAllQuestionsAttempted() {
    bool allAttempted = true;
    questionAttempted.forEach((isAttempted) {
      if(isAttempted){
        // no nothing; move to next
      } else{
        allAttempted = false;
      }
    });
    return allAttempted;
  }

  bool checkAllSectionsCompleted() {
    bool allSectionsCompleted = true;
    List<bool> allSections = new List();
    allSections.add(sharedPreferences.getBool('stayHydratedCompleted'));
    allSections.add(sharedPreferences.getBool('sneezeSectionCompleted'));
    allSections.add(sharedPreferences.getBool('socialDistanceCompleted'));
    allSections.add(sharedPreferences.getBool('tissueHandlingCompleted'));
    allSections.add(sharedPreferences.getBool('washingHandsCompleted'));

    allSections.forEach((isSectionCompleted) {
      if(isSectionCompleted != null){
        if(isSectionCompleted){
          // no nothing; move to next
        } else{
          allSectionsCompleted = false;
        }
      } else{
        allSectionsCompleted = false;
      }
    });
    return allSectionsCompleted;
  }

  void calculateAndSaveTotal() async {
    double stayHydratedMarks = sharedPreferences.getDouble('stayHydratedMarks');
    double sneezeSectionMarks = sharedPreferences.getDouble('sneezeSectionMarks');
    double socialDistanceMarks = sharedPreferences.getDouble('socialDistanceMarks');
    double tissueHandlingMarks = sharedPreferences.getDouble('tissueHandlingMarks');
    double washingHandsMarks = sharedPreferences.getDouble('washingHandsMarks');

    double totalMarks = stayHydratedMarks + sneezeSectionMarks + socialDistanceMarks + tissueHandlingMarks + washingHandsMarks;
    await sharedPreferences.setDouble('totalMarks', totalMarks);
    print('Total of all 5 sections is calculated and saved!');

    Navigator.pushNamed(context, '/result');
  }
}



Widget surveyCarousel(){
int _current = 0;
  List<SurveyTitle> surveylist = [
    SurveyTitle('Social Distancing',1, '/survey'),
    SurveyTitle('Sneeze Cough',0, '/sneeze'),
    SurveyTitle('Stay Hydrated',0, '/hydration'),
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

class CoronaSlider extends StatefulWidget {
  @override
  _CoronaSliderState createState() => _CoronaSliderState();
}


class _CoronaSliderState extends State<CoronaSlider> {

  double _value = 0.1;

  void _setvalue(double value) => setState(() => _value = value);


  @override
  Widget build(BuildContext context) {

        return Center(
          child: Container(
          width: 300.0,
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
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
          )
    );
  }
}

// *? This is the Survey general question 
Widget surveyTitleQuestion(){
  return   Padding(padding: EdgeInsets.fromLTRB(25, 15, 25, 10),
          
            child: Text('COVID-19 can spread by tiny droplets from the infected person travelling up to 2-3 meters \n \nKeep a distance of at least ____ meters when you meet someone. ',
            style: TextStyle(fontSize: 21, fontFamily: 'Seg'),),
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
                  Center(child:   Text('Social Distancing is the best \n way to STOP the disease.',
                    style: TextStyle(
                      fontSize: 21,
                      fontFamily: 'Seg',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2D9CDB),
                    ),)
                  ),

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