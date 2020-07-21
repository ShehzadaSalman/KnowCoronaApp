import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SurveyTitle.dart';
import 'QuizHelper.dart';
import 'package:http/http.dart' as http;



class Hydration extends StatefulWidget {
  @override
  _HydrationState createState() => _HydrationState();
}

class _HydrationState extends State<Hydration> {

  // we do all the here before the app is started
 String apiURL = "https://knowcorona19.com/api/secondapi";
  // String apiURL = "http://shahzada.website/covid/public/api/newApi";
//  List<AnswersWithStats> allAnswersWithStats;
  List<String> answerSelected;
  List<bool> submitEnabled;
  List<bool> submitPressed;
  List<bool> questionAttempted;
  bool displayHydrationNotification = false;
  bool stayHydratedCompleted = false;
  int correctAttempted = 0;
  double stayHydratedMarks = 0.0;
  SharedPreferences sharedPreferences;
 
QuizHelper quizHelper;

int quizIndex = 0;
  @override
  void initState(){
//    allAnswersWithStats = List();
    answerSelected = List();
    submitEnabled = List();
    submitPressed = List();
    questionAttempted = List();
    // do something here
     fetchQuiz();
     initializeSharedPreferences();
    super.initState();

  }

   storestat(int clicked, String postID, String optionTitle, bool isRight) async{
    
     
      
    String postURL = "https://knowcorona19.com/api/storestat";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
     '{"post" : "$postID" , "stat":  "$clicked", "title": "$optionTitle", "isRight" : "$isRight"}';
    try{
    http.Response response = await http.post(postURL,headers: headers, body: json);    
    print(response.body);

    }catch(err){
     print('Error sending data to the api for option stats'); 
    }
    

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
//            results.incorrectAnswers.shuffle();
            results.incorrectStats.add(
                results.correctStat
            );
            for(int i=0; i<results.incorrectAnswers.length; i++){
              AnswersWithStats answersWithStats = AnswersWithStats();
              answersWithStats.answers = results.incorrectAnswers[i];
              answersWithStats.stats = results.incorrectStats[i];
              results.allAnswersWithStats.add(answersWithStats);
              results.totalStatsCount = results.totalStatsCount + int.parse(results.incorrectStats[i]);
        }
            results.allAnswersWithStats.shuffle();
            answerSelected.add('');
            submitEnabled.add(false);
            submitPressed.add(false);
            questionAttempted.add(false);
          });
//   
    });
  }








  makePostRequest() async{
    String postURL = "http://shahzada.website/covid/public/api/storingflutter";
    Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"title": "Hello", "body": "body text", "userId": 1}';

    http.Response response = await http.post(postURL,headers: headers, body: json);

    if(response.statusCode == 201){
      print(response.body);
    }else{
      throw Exception('Failed to post data to the laravel application');
    }
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
//         checkAlbum('Salman');
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
                     Visibility(
                       visible: displayHydrationNotification,
                       child:  Center(
                       child: Container(
                         padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                         width: 280,
                         child:RichText(
                            text: TextSpan(
                              text: 'Important: ',
                              style: TextStyle(
                                fontFamily: 'Seg',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFF4364F),
                              ),
                              children: <TextSpan>[
                                TextSpan(text: ' If you are suffering from any of the following problems, please do not drink too much water without consulting your physician:',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),),
                                TextSpan(text: "\n - Heart Disease",
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
                                TextSpan(text: "\n - Kidney Disease",
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize:14)),
                                TextSpan(text: "\n - Liver Disease",
                                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
                              ],
                            ),
                          ),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(10),
                             boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                         ),
                       )
                     ),

                     ),
                     SizedBox(height: 40),
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
                                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                                     child: Column(
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: quizHelper.results[index].incorrectAnswers.map((f){
                                       children: quizHelper.results[index].allAnswersWithStats.map((f){
                                    Color color;
                                    Color percentageColor;
                                    Icon icon = Icon(
                                      Icons.do_not_disturb_on,
                                      color: Color(0xFFF58A97),
                                      size: 25.0,
                                    );
                                         if(submitPressed[index]){
                                           if(f.answers.compareTo(quizHelper.results[index].correctAnswer) == 0){
                                             color = Color(0xFF6FCF97);
                                             percentageColor = Color(0xFF6FCF97);
                                             icon = Icon(
                                               Icons.check_circle,
                                               color: Color(0xFF6FCF97),
                                               size: 25.0,
                                             );
                                           } else if(f.answers.compareTo(answerSelected[index]) == 0){
                                             color = Color(0xFFF58A97);
                                             percentageColor = Color(0xFFF58A97);
                                           } else{
                                             color = null;
                                             percentageColor = Color(0xFFF58A97);
                                           }
//                                           f.answers.compareTo(quizHelper.results[index].correctAnswer) == 0
//                                               ? color = Color(0xFF6FCF97) :
//                                           f.answers.compareTo(answerSelected[index]) == 0
//                                               ? color = Color(0xFFF58A97) : color = null;
                                         } else{
                                           f.answers.compareTo(answerSelected[index]) == 0
                                               ? color = Color(0xFF56CCF2) : color = null;
                                         }
                                         return Row(
                                           children: <Widget>[
                                       SizedBox(
                                         width: 250,
                                         child: RaisedButton(
                                             color: color,
                                             padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                                             onPressed: (){
                                               setState(() {

                                                 if(questionAttempted[index]){
                                                   // do nothing; question already attempted
                                                 } else{
                                                   answerSelected[index] = f.answers;
                                                   submitEnabled[index] = true;
                                                 }
                                               });
                                             },
                                             elevation: 0,
                                             child: Text(f.answers, style: TextStyle(
                                               fontSize: 13,
                                             ),),

                                         ),
                                       ),
                                       SizedBox(width: 5),
                                       submitPressed[index]
                                           ? icon
                                           : Container(height: 0, width: 0,),
                                       SizedBox(width: 5),
                                        submitPressed[index]
                                            ? Text(((int.parse(f.stats)/quizHelper.results[index].totalStatsCount)*100).round().toString() + '%', style: TextStyle(
                                          color: percentageColor,
                                        ),)
                                            : Container(height: 0, width: 0,),
                                           ]
                                         );
                                       }).toList(),
                                     ),
                                   ),
//                                   Container(
//                                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                                     child: Column(
//                                       children: quizHelper.results[index].incorrectAnswers.map((f){
//                                         return SizedBox(
//                                           width: double.infinity,
//                                           child: RaisedButton(
//                                             padding: EdgeInsets.symmetric(vertical: 12),
//                                             onPressed: (){
//                                               checkAnswer(f, index);
//                                             },
//                                             elevation: 0,
//                                             child: Text(f),
//                                           ),
//                                         );
//                                       }).toList(),
//                                     ),
//                                   ),
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
                                           //id for post request
                                           quizHelper.results[index].id;
                                           //text of selected option
                                           answerSelected[index];
                                           // this check can be used for post request
                                              if(checkAnswer(answerSelected[index], index)){
                                              
                                                storestat(20,  quizHelper.results[index].id, answerSelected[index], true);
                                              }else{
                                                storestat(20, quizHelper.results[index].id, answerSelected[index], false);
                                              }

                                           setState(() {
                                             displayHydrationNotification = true;
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
                                               stayHydratedMarks = ((correctAttempted/quizHelper.results.length)*(100))*(2/100); // "2" here being the total marks of section
                                               print('Marks from this section: ' + stayHydratedMarks.toString());
                                               print('Saving data stayHydratedMarks...');
                                               saveToSharedPreferences();
                                               print('Data saved!');
                                               final snackBar = SnackBar(content: Text('Congratulations! You have finished the Hydration Section'));

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

  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    stayHydratedCompleted = sharedPreferences.getBool('stayHydratedCompleted');
    stayHydratedMarks = sharedPreferences.getDouble('stayHydratedMarks');
    print('stayHydratedCompleted - from SharedPreferences : ' + stayHydratedCompleted.toString());
    if(stayHydratedCompleted != null && stayHydratedCompleted){
      print('Section already completed');
      print('Marks obtained in Stay Hydrated section: ' + stayHydratedMarks.toString());
    }
  }

  void saveToSharedPreferences() async {
    await sharedPreferences.setBool('stayHydratedCompleted', true);
    await sharedPreferences.setDouble('stayHydratedMarks', stayHydratedMarks);
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

//    bool stayHydratedCompleted = sharedPreferences.getBool('stayHydratedCompleted');
//    bool sneezeSectionCompleted = sharedPreferences.getBool('sneezeSectionCompleted');
//    bool socialDistanceCompleted = sharedPreferences.getBool('socialDistanceCompleted');
//    bool tissueHandlingCompleted = sharedPreferences.getBool('tissueHandlingCompleted');
//    bool washingHandsCompleted = sharedPreferences.getBool('washingHandsCompleted');
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

  

checkAlbum(String title) async{
  final http.Response response = await http.post(
    'https://jsonplaceholder.typicode.com/albums',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return "The data has been posted";
  } else {
    throw Exception('Failed to create album.');
  }


}
